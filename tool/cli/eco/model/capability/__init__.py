import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelCapabilityCLI(SubCommand):
    cmd_context = "eco.model.capability"

@click.command(cls=EcosystemModelCapabilityCLI)
@pass_application
def cli(ctx, path):
    """
    Capabilities are things we can do.
    """
