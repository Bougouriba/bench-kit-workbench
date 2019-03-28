import click


@click.command('describe', short_help='Describe a repository')
@click.option('--repo','repo_',
    help="The repo")
@click.pass_obj
def cli(ctx,repo_):
    """
    Obtain information about a repository
    """
    result = ctx.github.api.get_repo(repo_)
    click.echo(result)

    contribs = result.get_contributors()
    for contrib in contribs:
        click.echo(contrib)

    collabs = result.get_collaborators()
    for collab in collabs:
        click.echo(collab)
