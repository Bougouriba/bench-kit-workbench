import click
from cli import pass_application


@click.command('docs', short_help='Export logs about doc updates.')
@pass_application
def cli(ctx):
    """
	Report information about docptr uploads, downloads.
    """
