import click
import cli
from .. import pass_util as pass_focus_util

class BusinessUtilities(object):
    """
    These actions represent the business perspective.


    """
    def __init__(self,focus_util):
        self.focus_util = focus_util.initialize('business')

pass__util = click.make_pass_decorator(BusinessUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@pass_focus_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,focus_util):
    """
    Manipulate information about the business aspects of SSI.

    Specific Business Events
        report-event
        anticipate-event
        announce-event
        announce-capability

    Ontology Core
        assert-event-info
        assert-product-info
        assert-capability-info

    Cross focus linking is managed in this way
        legal-bridge
        tech-bridge


    """
    ctx.obj = BusinessUtilities(focus_util)
