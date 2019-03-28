import click
import cli

class WorkspaceUtilities(object):
    """
    This is available within all Workspace commands
    """
    def __init__(self,workspace):
        self.workspace = workspace


pass_workspace_util = click.make_pass_decorator(WorkspaceUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@cli.pass_application
@click.pass_context
def cli(ctx,app):
    """
    Manipulate the workspace
    """
    ctx.obj = WorkspaceUtilities(app.workspace)
