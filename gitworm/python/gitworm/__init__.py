import github
import os
import json

from .gitcontrol import *
from .serializer import Serializer

class GitWorm(object):

    def __init__(self,base,identity):
        self.base = base
        self.gitcontrol = GitWormCheckout(base)

        self.gitcontrol.activate_repo()

        self.model_dir = os.path.join(self.base,"model")
        if not os.path.exists(self.model_dir):
            os.makedirs(self.model_dir)

        self.files_dir = os.path.join(self.base,"files")
        if not os.path.exists(self.files_dir):
            os.makedirs(self.files_dir)

        self.serializer = Serializer(self.model_dir)


        self.identity = identity
        self.current_messages = None

    ## ------------------------------------------------ Commit/Txn
    def start_transaction(self,context):
        """
        """
        if self.current_messages != None:
            raise Exception("Can not nest transactions")

        self.current_messages = []

    def commit_transaction(self,context):
        """
        """
        if self.current_messages == None:
            return

        # TODO - implement me

        # erase commit data
        self.current_messages = None


    ## ------------------------------------------------ Merge
    def update(self):
        """
        """

    ## ------------------------------------------------ Files
    def replace_file(self,file_id,context,source):
        """
        Replace a file with content
        """

    def delete_file(self,file_id,context):
        """
        Replace a file with content
        """

    ## ------------------------------------------------ Model
    def load_model(self):
        """
        Apply Object to the GitWORM, but do not delete
        """
        model = self.serializer.read_model()
        if len(model) == 0:
            return None
        return model

    def merge_model(self,context,model):
        """
        Apply Object to the GitWORM, but do not delete
        """
        self.serializer.write_model(model,prune=False)
        self.gitcontrol.match(context.message)

    def assert_model(self,context,model):
        """
        Match the state of the worm to object
        """
        self.serializer.write_model(model,prune=True)
        self.gitcontrol.match(context.message)

    def delete_model(self,context):
        """
        Delete Data from the GitWORM
        """
        self.serializer.write_model({},prune=True)
