import click
import cli
from . import pass_util


@click.command('pull', short_help='Pull all branch data and update current branch.')
@pass_util
@cli.pass_application
def cli(app,util):
    """

    """
