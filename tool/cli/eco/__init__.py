import click
import cli

# this will migrate to services
class Ecosystem(object):
    """
    Ecosystems represent
    """
    def __init__(self):
        pass

    # input-action

    # output-action

    # update-action

class EcosystemUtilities(object):
    """
    Provides support for Ecosystems

    """
    def __init__(self):
        pass

pass_util = click.make_pass_decorator(EcosystemUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@cli.pass_application
@click.pass_context
def cli(ctx,app):
    """
    Perform ecosystem level tasks.
    """
    ctx.obj = EcosystemUtilities()
