import click
import importlib
import cli as BaseModule
import os
from click.testing import CliRunner

def list_commands(prefix,package_name):
    rv = []

    mod = importlib.import_module(package_name)
    pkg = importlib.import_module(mod.__package__)
    folder = pkg.__path__[0]

    subcommands=set()
    for filename in os.listdir(folder):
        # get files of the form <dir>/<command>.py
        if filename.endswith('.py') and \
           not filename.startswith('__'):
            rv.append(filename[:-3])
        # find directories
        if os.path.isdir(os.path.join(folder,filename)) and \
           not filename.startswith('__'):
            rv.append(filename)
            subcommands.add(filename)
    rv.sort()

    for cmd in rv:
        dump_output(prefix,cmd,package_name+"."+cmd,cmd in subcommands)


def dump_output(prefix,name,package_name,recurse=True):

    runner = CliRunner()

    try:
        mod = importlib.import_module(package_name)
        result = runner.invoke(mod.cli,['--help'])
        message=result.output
    except ModuleNotFoundError as E:
        raise click.UsageError("Command not found: %s" % package_name[4:])
    except ImportError as E:
        message="Import Error"

    print("%s %s\n\n```shell \n%s\n```\n\n" % (prefix,name,message))

    if recurse:
        list_commands("#"+prefix,package_name)


@click.command('manual')
@click.pass_context
def cli(ctx):
    """dumps the manual"""
    dump_output("#","tool","cli")
