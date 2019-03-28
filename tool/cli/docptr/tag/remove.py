import click
from cli import pass_application


@click.command('path', short_help='Remove a tag from a docptr.')
@pass_application
def cli(ctx):
    """
	Simply report the current configuration used by default.
    """
