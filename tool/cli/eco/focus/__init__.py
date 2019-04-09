import click
import cli
from .. import pass_util as pass_ecosystem_util

class FocusUtilities(object):
    """
    A Focus is a view of an ecosystem with a set of filtration constraints

    self.eco   The global ecosystem over which we are operating

    """
    def __init__(self,eco):
        self.eco = eco

pass_util = click.make_pass_decorator(FocusUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@pass_ecosystem_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,util):
    """
    Perform focused ecosystem level tasks.  Focused tasks manpipulate
    the KISIA model through filters that help maintain the integraty
    of the global map.

    \b
    Business Focus Tasks
      - manage information about a business
      - record the sponsoring of an event
      - manage records of business partnerships

    \b
    Legal Focus Tasks
      - manage information about recent legislation

    \b
    Technology Focus Tasks
      - manage information about a standard
      - manage information about a signficant repository
    """
    ctx.obj = FocusUtilities(util)
