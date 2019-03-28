import click
from cli import pass_application


@click.command('report', short_help='Generate detailed report about tag use.')
@pass_application
def cli(ctx):
    """
	Simply report the current configuration used by default.
    """
