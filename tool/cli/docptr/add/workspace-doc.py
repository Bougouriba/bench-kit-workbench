import click
from services.workspace import WorkspaceFilePointer

@click.command('workspace-path')
@click.option('--path','path_',
    type=click.STRING
    )
@click.pass_obj
def cli(ctx,path_):
    """
    Add a local workspace file
    """
    ctx.handle(
        WorkspaceFilePointer(ctx.util.name,path_)
    )
