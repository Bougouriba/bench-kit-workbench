import click
from cli import pass_application


@click.command('evaluate-complexity', short_help='Evaluate the Complexity of a Document.')
@pass_application
def cli(ctx):
    """
    """
