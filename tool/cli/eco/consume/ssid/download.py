import click
from cli import pass_context


@click.command('raw', short_help='Download a file via HTTP or HTTP(S).')
@pass_context
def cli(ctx):
    """
	Download a file given a docptr or url, and update the document
    tracking logs.

    \b
    download --docptr <DocPtr>
        This will download a document and save it in specified
        workspace path.  It will abort if no workspace path is
        configured.

    \b
    download --docptr <DocPtr> --to <WorkspacePath>
        This will download a document and set the workspace path
        to the workspace path given if the workspace path is
        not given.  If the workspace path is given, and it does
        not match, then the command aborts.

    \b
    download --docptr <DocPtr> --save-to <SystemPath>
        This will download a document to a specific system path.

    \b
    download --url <Url> --to <WorkspacePath>
        This will assess a file from a URL and add it to the config
        as a docptr if the URL can be accessed.  It will then trigger
        download via the docptr.
    """
