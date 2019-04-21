import click
import cli

@click.command('repolist')
@cli.common_table_output_options
@click.pass_obj
def cli(ctx,util):
    """
    Dump information about the repos
    """
