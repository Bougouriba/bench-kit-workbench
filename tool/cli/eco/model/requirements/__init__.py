import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelRequirementsCLI(SubCommand):
    cmd_context = "eco.model.Requirements"

@click.command(cls=EcosystemModelRequirementsCLI)
@pass_application
def cli(ctx, path):
    """
    What does SSI technology need to do?
    """
