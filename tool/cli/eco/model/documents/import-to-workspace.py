import click
from cli import pass_context


@click.command('import-to-workspace', short_help='Assign a docptr in the current workspace.')
@pass_context
def cli(ctx):
    """
	Assign a docptr in the current workspace..
    """
