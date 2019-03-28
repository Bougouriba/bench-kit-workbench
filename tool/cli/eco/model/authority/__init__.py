import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelAuthorityCLI(SubCommand):
    cmd_context = "eco.model.authority"

@click.command(cls=EcosystemModelAuthorityCLI)
@pass_application
def cli(ctx, path):
    """
    Governments, Jurisdictions, and other governing bodies.
    """
