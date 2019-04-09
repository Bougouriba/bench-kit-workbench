import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeVeresOneCLI(SubCommand):
    cmd_context = "eco.interact.consume.VeresOne"

@click.command(cls=EcosystemInteractConsumeVeresOneCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    Veres.one
    """
