import click
from cli import SubCommand,pass_application


class XlateUtilities(object):
    """
    This is available within all xlate commands
    """
    def __init__(self):
        pass

pass_xlate_util = click.make_pass_decorator(XlateUtilities)
class XlateCLI(SubCommand):
    cmd_context = "xlate"

@click.command(cls=XlateCLI)
@pass_application
@click.pass_context
def cli(ctx,app):
    """Translate between workspace resident JSON data models."""
    ctx.obj = XlateUtilities()
