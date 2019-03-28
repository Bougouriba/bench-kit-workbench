import os
import sys
import click
from cli import SubCommand
from apis.github import GitHub

class GitHubCLI(SubCommand):
    cmd_context = "github"

class GitHubCLIContext(object):
    def __init__(self,config):
        self.credentials = None
        self.config = config
        self.github = GitHub(config.getGitHubAccessToken())

@click.command(cls=GitHubCLI)
@click.pass_context
def cli(ctx):
    """Pull information from GitHub API."""
    ctx.obj = GitHubCLIContext(ctx.parent.obj.config)
