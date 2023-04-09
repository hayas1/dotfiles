import os, sys
import click, json5


@click.group()
def cli():
    pass


@cli.command()
@click.argument("json", type=click.File("r"))
def test_installed_extensions(json):
    devcontainer = json5.loads(json.read())
    installed = installed_extensions()
    for installing in devcontainer["customizations"]["vscode"]["extensions"]:
        if not any(e.startswith(str(installing).lower()) for e in installed):
            sys.exit(1)


def installed_extensions(path=os.path.join(os.getenv("HOME"), ".vscode-server", "extensions")):
    return {str(e).lower() for e in os.listdir(path)}


if __name__ == "__main__":
    cli()
