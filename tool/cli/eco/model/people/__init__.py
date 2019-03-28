import os
import sys
import click
from cli import SubCommand,pass_application

class EcosystemModelPeoplesCLI(SubCommand):
    cmd_context = "eco.model.people"

@click.command(cls=EcosystemModelPeoplesCLI)
@pass_application
def cli(ctx, path):
    """
    Natural Persons
    """
