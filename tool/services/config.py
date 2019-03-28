"""
Management of the configuration system
"""
import os
import click
import json
from pathlib import Path

class KISIA_Config(object):
    """
    Contains all of the configuration.

    Note: During the first iteration we will just load/save this all
    at once, upon any change.
    """
    filename = "configuration.json"

    def __init__(self,config_path):
        if config_path == None:
            config_path = os.path.join(str(Path.home()),".config/kisia");

        try:
            if not os.path.exists(config_path):
                os.makedirs(config_path)
        except Exception as E:
            raise click.BadParameter("Directory %s is not valid configuration directory:%s" % (config_path,E))

        self.config_path = config_path
        self.data = {}

        try:
            if not os.path.exists(self.config_file_name()):
                self.save()
                self.load()
            else:
                self.load()
                self.save()
        except Exception as E:
            raise Exception("Failed to load configuration in %s, reason=%s" % (self.config_file_name(),E))

        self.docptr = DocPtrConfig(self)
        self.workspace = WorkspaceConfig(self)

    # this should be private....
    def config_file_name(self):
        """
        Return the configuration file
        """
        return os.path.join(self.config_path,self.filename)

    def load(self):
        """
        Load the configuration object
        """
        with open(self.config_file_name(), encoding='utf-8-sig') as json_file:
            self.data = json.load(json_file)

    def save(self):
        """
        Save the configuration file
        """
        with open(self.config_file_name(),'w', encoding='utf-8-sig') as json_file:
            json.dump(self.data,json_file,indent=2,sort_keys=True,default=lambda x: x.__dict__)

    def ensureSection(self,section_name):
        """
        make sure a section exists
        """
        if not section_name in self.data:
            self.data[section_name] = {}
            self.save()
        return self.data[section_name]


    # Google
    def getGoogleSecretsPath(self):
        """
        Return Google Secrets Path
        """
        googledata = self.ensureSection('google')
        if not 'secrets_file' in googledata:
            googledata['secrets_file'] = os.path.join(self.config_path,'google-secrets.json')
            self.save()
        return googledata['secrets_file']

    def getGoogleTokenPath(self):
        """
        Return Google Token Path
        """
        googledata = self.ensureSection('google')
        if not 'token_file' in googledata:
            googledata['token_file'] = os.path.join(self.config_path,'google-token.pickle')
            self.save()
        return googledata['token_file']

    # GitHub
    def getGitHubAccessToken(self):
        """
        Return GitHub Access Token
        """
        githubdata = self.ensureSection('github')
        if not 'access_token' in githubdata:
            return None
        return githubdata['access_token']

    def setGitHubAccessToken(self,token):
        """
        Update the GitHub Access Token
        """
        githubdata = self.ensureSection('github')
        githubdata['access_token'] = token
        self.save()

    def getGitHubUsername(self):
        """
        Return GitHub Username
        """
        githubdata = self.ensureSection('github')
        if not 'username' in githubdata:
            return None
        return githubdata['username']

    def setGitHubUsername(self,token):
        """
        Update the GitHub Username
        """
        githubdata = self.ensureSection('github')
        githubdata['username'] = token
        self.save()

    # GitWorm
    def getGitWormBase(self):
        """
        Return GitWorm Base
        """
        gitwormdata = self.ensureSection('gitworm')
        if not 'base' in gitwormdata:
            gitwormdata['base'] = os.path.join('/tmp/','gitworm')
            self.save()
        return gitwormdata['base']

    # NLP

class WorkspaceConfig(object):

    def __init__(self,config):
        self.config = config

        workspace_config = config.ensureSection('workspace')
        if not 'path' in workspace_config:
            workspace_config['path'] = "/tmp/kisia-workspace"
            config.save()

        self.base_dir = workspace_config['path']

    def changePath(self,new_path):
        workspace_config = self.config.ensureSection('workspace')
        workspace_config['path'] = new_path
        self.config.save()
        self.base_dir = workspace_config['path']

class DocPtrConfig(object):
    """
    """
    def __init__(self,config):
        self.config = config

        # now restore the config web of docptrs
        docdata = config.ensureSection('docptr')
        if not 'active' in docdata:
            docdata['active'] = list()
            config.save()
        self.active = docdata['active']
        if not 'retired' in docdata:
            docdata['retired'] = list()
            config.save()
        self.retired = docdata['retired']


    # Doc Ptrs
    def assertDocPtr(self,docptr):
        """
        Assert document pointer state.  If a docptr does not exist, add
        it.  If it does exist, then update the relevant information.
        """
        j = docptr.jsonify()
        self.retractDocPtr(docptr)
        self.active.append(j)
        self.config.save()

    def retractDocPtr(self,docptr):
        """
        Look up a docptr_id and retun the docptr if found.
        """
        j = docptr.jsonify()
        for item in list(self.active):
            if item['name']==j['name']:
                self.active.remove(item)
        self.config.save()

    def resetList(self,docptr_iterator):
        self.active.clear()
        self.active.extend(x.jsonify() for x in docptr_iterator)
        self.config.save()
