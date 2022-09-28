import sys
import argparse


def command_init(args):
    # TODO if no args, use shell script
    print(f'do init')


def command_update(args):
    # TODO if no args, use shell script
    print(f'do update')


def command_migrate(args):
    # TODO implement
    print('Migrate is unimplemented')
    sys.exit(1)


def command_help(args):
    print(parser.parse_args([args.command, '--help']))


def parser():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()

    parser_init = subparsers.add_parser('init', help='Command init')
    parser_init.set_defaults(handler=command_init)

    parser_update = subparsers.add_parser('update', help='Command update')
    parser_update.set_defaults(handler=command_update)

    parser_update = subparsers.add_parser('migrate', help='Command update')
    # parser_update.add_argument('-f', '--force', action='store_true', help='overwrite current configuration')
    parser_update.set_defaults(handler=command_migrate)

    parser_help = subparsers.add_parser('help', help='Help')
    parser_help.add_argument('command', help='Command help')
    parser_help.set_defaults(handler=command_help)

    return parser


if __name__ == '__main__':
    parser = parser()
    args = parser.parse_args()
    if hasattr(args, 'handler'):
        args.handler(args)
    else:
        parser.print_help()
