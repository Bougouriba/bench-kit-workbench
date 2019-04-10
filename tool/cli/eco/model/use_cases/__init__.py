import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelUseCasesCLI(SubCommand):
    cmd_context = "eco.model.use-cases"

@click.command(cls=EcosystemModelUseCasesCLI)
@pass_application
def cli(ctx, path):
    """
    Manage information about SSI UseCases
    """
