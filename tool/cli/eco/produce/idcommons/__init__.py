import os
import sys
import click
from cli import Context,SubCommand,pass_context,CONTEXT_SETTINGS

class EcosystemInteractConsumeIdCommonsCLI(SubCommand):
    cmd_context = "eco.interact.consume.IdCommons"

@click.command(cls=EcosystemInteractConsumeIdCommonsCLI, context_settings=CONTEXT_SETTINGS)
@pass_context
def cli(ctx, path):
    """
    IdCommons.org (mapping project, others?)
    """
