import os
import sys
import click
import cli

from services.gitworm import GitWormUtilities
from apis.github import GitHub

pass_util = click.make_pass_decorator(GitWormUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@click.option("--worm","worm_",
    type=click.Path(
        exists=True,
        file_okay=False,
        dir_okay=True,
        resolve_path=True
        ),
    help="path to worm base")
@click.option("--identity","identity_",
    type=click.STRING,
    help="identity")
@click.pass_context
def cli(ctx,worm_,identity_):
    """
    Manage GitWorm checkout.
    """
    config = ctx.parent.obj.config
    if worm_ == None:
        worm_ = config.getGitWormBase()

    ctx.obj = GitWormUtilities(worm_,identity_)
