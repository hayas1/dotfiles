import os, re
import click, json5


@click.group()
def cli():
    pass


@cli.command()
@click.argument("json", type=click.File("r"))
def prepare_mounts(json):
    devcontainer = json5.loads(json.read())
    for mount in devcontainer["mounts"]:
        Mount(mount).prepare_empty_source()


class Mount:
    def __init__(self, mount) -> None:
        m = Mount.parse(mount)
        self.source = m.get("source")
        self.target = m.get("target")
        self.bind = m.get("bind")
        self.consistency = m.get("consistency")

    def parse(mount):
        keys = {"source": "source", "src": "source", "target": "target", "dst": "target"}
        keys |= {"type": "type", "consistency": "consistency"}
        match mount:
            # TODO better parse (do not use split)
            case str():
                # mounts: ["source=hoge,target=fuga,type=bind", ...]
                return {keys[k]: v for kv in mount.split(",") for k, v in [kv.split("=", maxsplit=1)]}
            case dict():
                # mounts: [{"source": "hoge", "target": "fuga", "type": "bind"}, ...]
                return mount
            case _:
                raise ValueError(f'cannot parse as "mounts" object')

    def resolved_source(self):
        # TODO better implementation (do not use regex)
        return str(re.sub(r"\$\{localEnv:(.*)\}", lambda m: os.getenv(m.group(1)), self.source))

    def prepare_empty_source(self):
        path = self.resolved_source()
        if os.path.exists(path):
            return path, False
        elif path.endswith("/"):
            os.makedirs(path, 0o777, True)
            return path, True
        else:
            os.makedirs(os.path.dirname(path), 0o777, True)
            open(path, "w").close()
            return path, True


if __name__ == "__main__":
    cli()
