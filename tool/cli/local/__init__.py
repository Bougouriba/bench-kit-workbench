import click
from cli import SubCommand,pass_application


class LocalUtilities(object):
    """
    This is available within all local commands
    """
    def __init__(self):
        pass

pass_local_util = click.make_pass_decorator(LocalUtilities)
class LocalCLI(SubCommand):
    cmd_context = "local"

@click.command(cls=LocalCLI)
@pass_application
@click.pass_context
def cli(ctx,app):
    """Translate between workspace resident JSON data models."""
    ctx.obj = LocalUtilities()
