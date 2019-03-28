import click
import cli
from . import pass_util


@click.command('info')
@pass_util
@cli.pass_application
def cli(app,util):
    """
    Dump information about gitworm
    """
    app.output.dump_dictlist([
        {
            'path' :"Model Dir",
            'value':util.worm.model_dir
        },
        {
            'path' :"Files Dir",
            'value':util.worm.files_dir
        },
        {
            'path' :"Identity",
            'value':util.worm.identity
        }
    ])
