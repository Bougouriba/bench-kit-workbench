import click
import cli
from . import pass_util


@click.command('push', short_help='Push all branch data from current branch.')
@pass_util
@cli.pass_application
def cli(app,util):
    """

    """
