import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelStandardsCLI(SubCommand):
    cmd_context = "eco.model.standards"

@click.command(cls=EcosystemModelStandardsCLI)
@pass_application
def cli(ctx, path):
    """
    Technical specifications around which groups can organize
    """
