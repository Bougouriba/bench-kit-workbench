import os
import sys
import click
import cli
from apis.github import GitHub

class GitHubUtilities(object):
    """
    This is available within all github commands
    """
    def __init__(self,config):
        self.credentials = None
        self.config = config
        self.github = GitHub(config.getGitHubAccessToken())


pass_util = click.make_pass_decorator(GitHubUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@cli.pass_application
@click.pass_context
def cli(ctx,app):
    """
    Manage GitHubs, which describe a document which can be referenced
    using a short-form document name, and is either out there, on the
    internet (e.g. a google spreadsheet) or is local.  Docptrs maintain
    information about how to access each type of file.

    """
    ctx.obj = GitHubUtilities(app.config)
