import click
import os
from cli import pass_application,common_table_output_options
from . import pass_workspace_util

@click.command('list')
@common_table_output_options
@pass_workspace_util
@pass_application
def cli(app,util,**kwargs):
    """
    Update external documents in the workspace from external sources.
    """
    path = app.config.workspace.base_dir
    index = len(path)
    data = []
    for root, dirs, files in os.walk(path, topdown=False):
        for name in files:
            data.append(dict(
                type="file",
                name=name,
                path=os.path.join(root, name)[index:]
                ))
        for name in dirs:
            data.append(dict(
                type="dir",
                name=name,
                path=os.path.join(root, name)[index:]
                ))
    app.output.dump_dictlist(data,"Workspace is empty")
