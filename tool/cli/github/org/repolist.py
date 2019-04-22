import click
import cli
from . import pass_util
from pytablewriter import MarkdownTableWriter


@click.command('repolist')
@cli.common_table_output_options
@pass_util
@cli.pass_application
def cli(app,util,**kwargs):
    """
    Dump information about the repos
    """
    api = util.api
    org = util.api.get_organization(util.orgname)
    ip_repos = {}
    ip_people = {}
    repos = []
    for repo in org.get_repos():
        repos.append(util.util.make_dict_from_repo(repo))
        #repo.depth = 0
        #repos.append((0,repo.full_name))
    app.output.dump_dictlist(repos)
