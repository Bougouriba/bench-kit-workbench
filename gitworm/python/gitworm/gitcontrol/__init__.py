import github
import os
import json
import re
from git import Repo

class GitUpdateIdentity(object):
    """
    The information describing the action taken upon the worm
    """
    def __init__(self,message):
        self.message = message

class GitUpdateContext(object):
    """
    The information describing the action taken upon the worm
    """
    def __init__(self,message):
        self.message = message

class GitWormCheckout(object):
    """
    """
    def __init__(self,base):
        self.base = base
        self.gitpath = self.base + "/.git"
        self.repo = None

    def activate_repo(self):
        if os.path.exists(self.gitpath):
            self.repo = Repo(self.base)
        else:
            self.repo = Repo.init(self.base)

    def match(self,message):
        # this is required?
        def path_rewriter(entry):
            return entry.path

        add = [ item.a_path for item in self.repo.index.diff(None) if item.change_type in ['R','M','T','A'] ]
        #move = [ item.a_path for item in self.repo.index.diff(None) if item.change_type in ['R'] ]
        remove = [ item.a_path for item in self.repo.index.diff(None) if item.change_type in ['D'] ]
        untracked = list(self.repo.untracked_files)
        self.repo.index.add(untracked,path_rewriter=path_rewriter)
        if len(add) > 0:
            self.repo.index.add(add)
        #self.repo.index.move(move)
        if len(remove) > 0:
            self.repo.index.remove(remove)

        annotations = dict({
        'changed':add,
        'remove':remove,
        'untracked':untracked
        })
        message = message + "\n" + json.dumps(annotations,indent=4)
        self.repo.index.commit(message)
