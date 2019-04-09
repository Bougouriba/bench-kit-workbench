import click
import cli
from .. import pass_util as pass_focus_util

class TechnicalUtilities(object):
    """
    These actions represent the Technical perspective.

    Specific Technical Events
        report-event
        anticipate-event
        announce-event
        announce-capability

    Ontology Core
        assert-use-case-info
        assert-release-info
        assert-project-info
        assert-repository-info
        assert-feature-info

    Cross focus linking is managed in this way
        legal-bridge
        tech-bridge


    """
    def __init__(self,focus_util):
        self.focus_util = focus_util.initialize('Technical')

pass__util = click.make_pass_decorator(TechnicalUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@pass_focus_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,focus_util):
    """
    Manipulate information about the Technical aspects of SSI.
    """
    ctx.obj = TechnicalUtilities(focus_util)
