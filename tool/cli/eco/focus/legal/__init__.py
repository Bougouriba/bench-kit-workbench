import click
import cli
from .. import pass_util as pass_focus_util

class LegalUtilities(object):
    """
    These actions represent the Legal perspective.


    """
    def __init__(self,focus_util):
        self.focus_util = focus_util.initialize('Legal')

pass__util = click.make_pass_decorator(LegalUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@pass_focus_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,focus_util):
    """
    Manipulate information about the Legal aspects of SSI.

    \b
    Specific Legal Events
        report-event
        anticipate-event
        announce-event
        announce-capability

    \b
    Ontology Core
        assert-legislation-info
        assert-jurisdiction-info
        assert-project-info
        assert-repository-info
        assert-feature-info

    Cross focus linking is managed in this way
        legal-bridge
        tech-bridge


    """
    ctx.obj = LegalUtilities(focus_util)
