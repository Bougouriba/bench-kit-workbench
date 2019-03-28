import click
from cli import pass_context


@click.command('assert', short_help='Assert information about a standard in the model.')
@pass_context
def cli(ctx):
    """
	Add a standard to the model.
    """
