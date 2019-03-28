import click
import os
from cli import pass_application
from . import pass_workspace_util

def get_env():
    dict_list = []
    key_list = ['KT_PYTHON','KT_PIP','KT_PYTHON_DIR','KT_VIRTUALENV','KT_VENV_PATH']
    for key in key_list:
        dict_list.append(dict({
        "property":key,
        "value":os.environ[key]
        }))
    return dict_list

@click.command('info')
@click.option('--path','path_',
    is_flag=True,
    help="only report path"
    )
@pass_workspace_util
@pass_application
def cli(app,util,path_,**kwargs):
    """
    Dump some information about the workspace.
    """
    if path_:
        click.echo(app.config.workspace.base_dir)
    else:
        path = app.config.workspace.base_dir
        if not os.path.exists(path):
            click.echo("Workspace does not exist at %s" % path)
        else:
            dict_list=[
                dict({
                    "property" : "Path",
                    "value" : path
                }),
                dict({
                    "property" : "another property",
                    "value" : "another value"
                })
            ]

            dict_list.extend(get_env())
            app.output.dump_dictlist(dict_list)
