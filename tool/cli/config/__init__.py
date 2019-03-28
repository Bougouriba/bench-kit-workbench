import click
import cli

class ConfigUtilities(object):

    def __init__(self):
        pass

pass_config_util = click.make_pass_decorator(ConfigUtilities)
class SubCommand(cli.BaseCommand):
    pass

@click.command(cls=SubCommand)
@cli.pass_application
@click.pass_context
def cli(ctx,app):
    """
    Manage the toolkit configuration settings.
    """
    ctx.obj = ConfigUtilities()
