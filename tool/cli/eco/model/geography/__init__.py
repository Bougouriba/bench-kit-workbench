import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelGeographyCLI(SubCommand):
    cmd_context = "eco.model.geography"

@click.command(cls=EcosystemModelGeographyCLI)
@pass_application
def cli(ctx, path):
    """
    Countries, Governments,
    """
