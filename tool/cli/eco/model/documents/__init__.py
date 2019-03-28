import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelDocumentsCLI(SubCommand):
    cmd_context = "eco.model.documents"

@click.command(cls=EcosystemModelDocumentsCLI)
@pass_application
def cli(ctx, path):
    """
    Documents are publications, legislation, papers, presentations, slideshows, etc.
    """
