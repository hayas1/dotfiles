# create the top-level parser
import argparse


def init(args):
    print("init args:", args)


def migrate(args):
    print("migrate is developing...", args)


def clean(args):
    print("clean args:", args)


def prune(args):
    print("prune args:", args)


def update(args):
    print("update args:", args)


# TODO use dataclass or Enum
FEATURES = [
    "python",
    "rust",
    "go",
    "node",
    "java",
    "terraform",
    "kubectl-helm-minikube",
    "docker-from-docker",
    "aws-cli",
    "github-cli",
]


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog="devc")
    parser.add_argument("--color", action="store_true", help="Enable color")
    subparsers = parser.add_subparsers(help="sub-command")

    init_parser = subparsers.add_parser("init", help="Initialize workspace")
    init_parser.add_argument("-f", "--force", action="store_true", help="Force initialization with over write")
    init_parser.add_argument("--gitignore", action="store_true", help="Make gitignore in copied directory")
    init_parser.add_argument("--features", choices=FEATURES, help="Initialize workspace with features")
    init_parser.set_defaults(handler=init)

    migrate_parser = subparsers.add_parser("migrate", help="Migrate workspace (developing)")
    migrate_parser.add_argument("-f", "--force", action="store_true", help="Force migration, overwrite workspace")
    migrate_parser.set_defaults(handler=migrate)

    clean_parser = subparsers.add_parser("clean", help="Clean workspace")
    clean_parser.add_argument("-y", "--yes", action="store_true", help="Clean workspace without confirmation")
    clean_parser.set_defaults(handler=clean)

    prune_parser = subparsers.add_parser("prune", help="Prune temporary directories")
    prune_parser.add_argument("-y", "--yes", action="store_true", help="Without confirmation")
    prune_parser.set_defaults(handler=prune)

    update_parser = subparsers.add_parser("update", help="Update local repository")
    update_parser.add_argument("-f", "--force", action="store_true", help="Uninstall once, and clone again")
    update_parser.set_defaults(handler=update)

    help_parser = subparsers.add_parser("help", help="Help")
    help_parser.add_argument("command", help="Command help")
    help_parser.set_defaults(handler=lambda args: print(parser.parse_args([args.command, "--help"])))

    args = parser.parse_args()
    if hasattr(args, "handler"):
        args.handler(args)
    else:
        parser.print_help()
