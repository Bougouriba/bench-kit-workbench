import click
from apis.google import authorize_to_gapi


@click.command('login', short_help='Login to Google.')
@click.pass_obj
def cli(google_cli_context):
    """
    Log in to google and records API credentials in the config directory.
    """
    authorize_to_gapi(
        secrets_file=google_cli_context.secrets_file,
        token_file=google_cli_context.token_file
    )
