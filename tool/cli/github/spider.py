import click

class Repository(object):
    def __init__(self,name,data,contribs):
        self.name = name
        self.data = data
        self.contribs = contribs
        self.people = {}

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
