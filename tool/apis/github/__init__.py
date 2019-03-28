import github

class GitHub(object):
    def __init__(self,token):
        self.api = github.Github(login_or_token=token)
