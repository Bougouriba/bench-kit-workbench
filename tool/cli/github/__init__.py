import os
import sys
import click
import cli
from apis.github import GitHub

class GitHubUtilities(object):
    """
    This is available within all github commands
    """
    def __init__(self,config):
        self.credentials = None
        self.config = config
        self.github = GitHub(config.getGitHubAccessToken())

    def set_field(self,a,b,c):
        a[c] = getattr(b,c)

    def make_dict_from_person(self,user):
        set_field = self.set_field
        result = {}
        set_field(result,user,'node_id')
        set_field(result,user,'avatar_url')
        set_field(result,user,'bio')
        set_field(result,user,'blog')
        set_field(result,user,'collaborators')
        set_field(result,user,'company')
        set_field(result,user,'contributions')
        set_field(result,user,'disk_usage')
        set_field(result,user,'email')
        set_field(result,user,'events_url')
        set_field(result,user,'followers')
        set_field(result,user,'followers_url')
        set_field(result,user,'following')
        set_field(result,user,'following_url')
        set_field(result,user,'gists_url')
        set_field(result,user,'gravatar_id')
        set_field(result,user,'hireable')
        set_field(result,user,'html_url')
        set_field(result,user,'id')
        set_field(result,user,'location')
        set_field(result,user,'login')
        set_field(result,user,'name')
        set_field(result,user,'organizations_url')
        set_field(result,user,'owned_private_repos')
        set_field(result,user,'private_gists')
        set_field(result,user,'public_gists')
        set_field(result,user,'public_repos')
        set_field(result,user,'received_events_url')
        set_field(result,user,'repos_url')
        set_field(result,user,'site_admin')
        set_field(result,user,'starred_url')
        set_field(result,user,'subscriptions_url')
        set_field(result,user,'total_private_repos')
        set_field(result,user,'type')
        set_field(result,user,'url')
        return result

    #created_at
    #Type:	datetime.datetime
    #permissions
    #Type:	github.Permissions.Permissions
    #plan
    #Type:	github.Plan.Plan
    #updated_at
    #Type:	datetime.datetime
    #suspended_at
    #Type:	datetime.datetime

    def make_dict_from_repo(self,repo):
        set_field = self.set_field
        result = {}
        set_field(result,repo,'allow_merge_commit')
        set_field(result,repo,'allow_rebase_merge')
        set_field(result,repo,'allow_squash_merge')
        set_field(result,repo,'archived')
        set_field(result,repo,'archive_url')
        set_field(result,repo,'assignees_url')
        set_field(result,repo,'blobs_url')
        set_field(result,repo,'branches_url')
        set_field(result,repo,'clone_url')
        if True:
            set_field(result,repo,'collaborators_url')
            set_field(result,repo,'comments_url')
            set_field(result,repo,'commits_url')
            set_field(result,repo,'compare_url')
            set_field(result,repo,'contents_url')
            set_field(result,repo,'contributors_url')
            set_field(result,repo,'default_branch')
            set_field(result,repo,'description')
            set_field(result,repo,'downloads_url')
            set_field(result,repo,'events_url')
            set_field(result,repo,'fork')
            set_field(result,repo,'forks')
            set_field(result,repo,'forks_count')
            set_field(result,repo,'forks_url')
            set_field(result,repo,'full_name')
            set_field(result,repo,'git_commits_url')
            set_field(result,repo,'git_refs_url')
            set_field(result,repo,'git_tags_url')
            set_field(result,repo,'git_url')
            set_field(result,repo,'has_downloads')
            set_field(result,repo,'has_issues')
            set_field(result,repo,'has_projects')
            set_field(result,repo,'has_wiki')
            set_field(result,repo,'homepage')
            set_field(result,repo,'hooks_url')
            set_field(result,repo,'html_url')
            set_field(result,repo,'id')
            set_field(result,repo,'issue_comment_url')
            set_field(result,repo,'issue_events_url')
            set_field(result,repo,'issues_url')
            set_field(result,repo,'keys_url')
            set_field(result,repo,'labels_url')
            set_field(result,repo,'language')
            set_field(result,repo,'languages_url')
            set_field(result,repo,'master_branch')
            set_field(result,repo,'merges_url')
            set_field(result,repo,'milestones_url')
            set_field(result,repo,'mirror_url')
            set_field(result,repo,'name')
            set_field(result,repo,'network_count')
            set_field(result,repo,'notifications_url')
            set_field(result,repo,'open_issues')
            set_field(result,repo,'open_issues_count')
            set_field(result,repo,'private')
            set_field(result,repo,'pulls_url')
            set_field(result,repo,'ssh_url')
            set_field(result,repo,'stargazers_count')
            set_field(result,repo,'stargazers_url')
            set_field(result,repo,'statuses_url')
            set_field(result,repo,'subscribers_url')
            set_field(result,repo,'subscribers_count')
            set_field(result,repo,'subscription_url')
            set_field(result,repo,'svn_url')
            set_field(result,repo,'tags_url')
            set_field(result,repo,'teams_url')
            set_field(result,repo,'topics')
            set_field(result,repo,'trees_url')
            set_field(result,repo,'url')
            set_field(result,repo,'watchers')
            set_field(result,repo,'watchers_count')

        return result


pass_util = click.make_pass_decorator(GitHubUtilities)
class SubCommand(cli.BaseCommand):
    pass
@click.command(cls=SubCommand)
@cli.pass_application
@click.pass_context
def cli(ctx,app):
    """
    Manage GitHubs, which describe a document which can be referenced
    using a short-form document name, and is either out there, on the
    internet (e.g. a google spreadsheet) or is local.  Docptrs maintain
    information about how to access each type of file.

    """
    ctx.obj = GitHubUtilities(app.config)
