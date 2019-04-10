import click
import cli
from .. import pass_util as pass_consume_util

class MyDataUtilities(object):
    """
    Load information into the KISIA model
    """
    def __init__(self,consume):
        self.consume = consume

pass_util = click.make_pass_decorator(MyDataUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@pass_consume_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,util):
    """
    Personal Data
    """
    ctx.obj = MyDataUtilities(util)
