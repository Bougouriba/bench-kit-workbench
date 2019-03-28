import click
from cli import pass_context


@click.command('assert', short_help='Assert information about an organization in the model.')
@pass_context
def cli(ctx):
    """
	Add an organization to the model or update information.
    """
