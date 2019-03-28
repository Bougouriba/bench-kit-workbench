import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeRWOTCLI(SubCommand):
    cmd_context = "eco.interact.consume.RWOT"

@click.command(cls=EcosystemInteractConsumeRWOTCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    Rebooting the Web-Of-Trust
    """
