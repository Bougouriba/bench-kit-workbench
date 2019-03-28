import click
import cli
from . import pass_util


@click.command('status')
@pass_util
@cli.pass_application
def cli(app,util):
    """
    Report status about the gitworm checkout.
    """
    dirty = util.worm.gitcontrol.repo.is_dirty()

    if not dirty:
        if 0 != len(util.worm.gitcontrol.repo.untracked_files):
            click.echo("Untracked files")
        else:
            click.echo("No changes")
    else:
        click.echo("Changes")
        pass
