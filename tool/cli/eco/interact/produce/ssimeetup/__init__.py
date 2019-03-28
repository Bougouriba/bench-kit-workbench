import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeHyperledgerCLI(SubCommand):
    cmd_context = "eco.interact.consume.hyperledger"

@click.command(cls=EcosystemInteractConsumeHyperledgerCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    SSIMeetup.com
    """
