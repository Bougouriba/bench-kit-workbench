import github
import os
import json
import re
from git import Repo

from gitworm import *

class GitWormUtilities(object):
    def __init__(self,worm_,identity_):
        self.worm = GitWorm(worm_,identity_)
