import click
from cli import GoogleDriveFolderId
from apis.google.docptr import GoogleFolderPointer

@click.command('google-folder')
@click.option('--folder','folder_',
    type=GoogleDriveFolderId()
    )
@click.pass_obj
def cli(ctx,folder_):
    """
    Add a google folder
    """
    ctx.handle(GoogleFolderPointer(ctx.util.name,folder_))
