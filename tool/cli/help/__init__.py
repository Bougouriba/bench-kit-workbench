import click

@click.command('help')
@click.pass_context
def cli(ctx):
    """prints help info"""
    click.echo(ctx.parent.get_help())
