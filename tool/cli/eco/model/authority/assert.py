import click
from cli import pass_context


@click.command('assert', short_help='Assert information about an authority in the model.')
@pass_context
def cli(ctx):
    """
	Update authority information.
    """
