import click
from cli import common_table_output_options,pass_application


@click.command('list')
@common_table_output_options
@pass_application
def cli(ctx):
    """
	List all tags used by docptrs.
    """
    data = list(ctx.config.docPtrManager.models.keys())
    print(data)
