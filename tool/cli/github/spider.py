import click

class Repository(object):
    def __init__(self,name,data,contribs):
        self.name = name
        self.data = data
        self.contribs = contribs
        self.people = {}

def set_field(a,b,c):
    a[c] = getattr(b,c)

def make_dict_from_person(user):
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

def make_dict_from_repo(repo):
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

#created_at
#Type: datetime.datetime
#organization
#Type:	github.Organization.Organization
#owner
#Type:	github.NamedUser.NamedUser
#parent
#Type:	github.Repository.Repository
#permissions
#Type:	github.Permissions.Permissions
#pushed_at
#Type:	datetime.datetime
#source
#Type:	github.Repository.Repository
#    set_field(result,repo,'updated_at
#Type:	datetime.datetime

class Person(object):
    def __init__(self,name,data,contributes_to,owns):
        self.name = name
        self.data = data
        self.contributes_to = contributes_to
        self.owns = owns
        self.repos = {}

def load_repository(api,name):
    path = '/tmp/repos/'+name
    if not os.path.exists(path):
        os.makedirs(path)
        print("Loading Repo Data for",name)
        repo_data = make_dict_from_repo(api.get_repo(name))
        with open(path+'/data.json','w') as f:
            json.dump(repo_data,f)
        with open(path+'/contributors.json','w') as f:
            json.dump([],f)
    with open(path+'/data.json','r') as f:
        repo_data = json.load(f)
    with open(path+'/contributors.json','r') as f:
        contribs = json.load(f)
    return Repository(name,repo_data,contribs)

def save_repository(repo):
    path = '/tmp/repos/'+repo.name
    with open(path+'/data.json','w') as f:
        json.dump(repo.data,f)
    with open(path+'/contributors.json','w') as f:
        json.dump(repo.contribs,f)

def load_person(api,login):
    path = '/tmp/people/'+login
    if not os.path.exists(path):
        print("Loading Person Data for",login)
        person = api.get_user(login)
        person_data = make_dict_from_person(person)
        os.makedirs(path)
        new_repos = person.get_repos()
        owns = []
        for repo in new_repos:
            owns.append(repo.full_name)
        with open(path+'/data.json','w') as f:
            json.dump(person_data,f)
        with open(path+'/contributes_to.json','w') as f:
            json.dump([],f)
        with open(path+'/owns.json','w') as f:
            json.dump(owns,f)
    with open(path+'/data.json','r') as f:
        person_data = json.load(f)
    with open(path+'/contributes_to.json','r') as f:
        contributes_to = json.load(f)
    with open(path+'/owns.json','r') as f:
        owns = json.load(f)
    return Person(login,person_data,contributes_to,owns)

def save_person(person):
    path = '/tmp/people/'+person.name
    with open(path+'/data.json','w') as f:
        json.dump(person.data,f)
    with open(path+'/contributes_to.json','w') as f:
        json.dump(person.contributes_to,f)
    with open(path+'/owns.json','w') as f:
        json.dump(person.owns,f)

import pickle
import os
import json
@click.command('spider', short_help='Spider an organization')
@click.option('--org','org_',
    help="The repo")
@click.pass_obj
def cli(ctx,org_):
    """
    Obtain information about an organization
    """
    api = ctx.github.api
    org = api.get_organization(org_)
    ip_repos = {}
    ip_people = {}
    repos = []
    for repo in org.get_repos():
        click.echo(repo)
        repo.depth = 0
        repos.append((0,repo.full_name))

    while len(repos) > 0 :
        (depth,repo_name) = repos.pop()
        #print("%3d :R+%5d :R %3d :P %3d" % (depth,len(repos),len(ip_repos),len(ip_people)),repo_name)
        if not repo_name in ip_repos:
            try:
                repository = load_repository(api,repo_name)
                ip_repos[repo_name]=repository
                if len(repository.contribs) == 0:
                    print("Fetching repo and contributors for",repo_name)
                    repo = api.get_repo(repo_name)
                    contribs = repo.get_contributors()
                    for contrib in contribs:
                        repository.contribs.append(contrib.login)
                    save_repository(repository)
                    print("Repository contrib count: ",repo_name,len(repository.contribs))
                for login in repository.contribs:
                    if login in ip_people:
                        person = ip_people[login]
                    else :
                        person = load_person(api,login)
                        ip_people[login] = person
                        if depth < 2 :
                            for new_repo_name in person.owns:
                                repos.append((depth+1,new_repo_name))

                    if person.name not in repository.contribs:
                        repository.contribs.append(person.name)
                        save_repository(repository)
                    if repository.name not in person.contributes_to:
                        person.contributes_to.append(repository.name)
                        save_person(person)
                #
                #try:
                #    collabs = repo.get_collaborators()
                #    for collab in collabs:
                #        people.add(collab.login)
                #except:
                #    pass

            except Exception as E:
                print("Error working with",repo.full_name,E)
                #repos.append((derepo)
                raise E

    with open('repos.pickle','w') as f:
        pickle.dump(ip_repos,f)
    with open('people.pickle','w') as f:
        pickle.dump(ip_people,f)
