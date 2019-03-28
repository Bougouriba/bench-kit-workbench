import click
from cli import pass_application


@click.command('http', short_help='Report logs about http traffic.')
@pass_application
def cli(ctx):
    """
	Report information about docptr uploads, downloads.
    """
