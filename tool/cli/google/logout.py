import click
import os

@click.command('logout', short_help='Logout of Google.')
@click.pass_obj
def cli(google_cli_context):
    """
    Logout of google and remove any config cached credentials.
    """
    token_file_path = google_cli_context.token_file
    if os.path.exists(token_file_path):
        os.remove(token_file_path)
