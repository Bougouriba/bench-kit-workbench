import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelOrganizationsCLI(SubCommand):
    cmd_context = "eco.model.organizations"

@click.command(cls=EcosystemModelOrganizationsCLI)
@pass_application
def cli(ctx, path):
    """
    Companies, Projects, Teams, Working Groups, etc.
    """
