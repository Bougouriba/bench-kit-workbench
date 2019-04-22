import os
import sys
import click
import cli
from .. import pass_util as pass_github_util

class GitHubOrgUtilities(object):
    """
    This is available within all docptr commands
    """
    def __init__(self,util,orgname):
        self.util = util
        self.orgname = orgname
        self.api = util.github.api

pass_util = click.make_pass_decorator(GitHubOrgUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@click.argument("org",
    required=True
    )
@pass_github_util
@cli.pass_application
@click.pass_context
def cli(ctx,app,util,org):
    """Work with github organizations"""
    ctx.obj = GitHubOrgUtilities(util,org)
