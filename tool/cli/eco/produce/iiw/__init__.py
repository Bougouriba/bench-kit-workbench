import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeIIWCLI(SubCommand):
    cmd_context = "eco.interact.consume.IIW"

@click.command(cls=EcosystemInteractConsumeIIWCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    Internet Identity Workshop
    """
