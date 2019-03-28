import click
from cli import pass_context


@click.command('assert', short_help='Assert information about a person in the model.')
@pass_context
def cli(ctx):
    """
	Add a person to the model.
    """
