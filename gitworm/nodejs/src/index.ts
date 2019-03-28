

from .gitcontrol import *
from .serializer import Serializer
import { GitWormCheckout } from './gitcontrol'
import { Serializer } from './serializer'

class GitWorm(object) {

  constructor(base,identity) {
      this.base = base
      this.gitcontrol = new GitWormCheckout(base)
      await this.gitcontrol.activate_repo()

      this.model_dir = os.path.join(this.base,"model")
      if not os.path.exists(this.model_dir):
          os.makedirs(this.model_dir)
      this.serializer = new Serializer(this.model_dir)

      this.files_dir = os.path.join(this.base,"files")
      if not os.path.exists(this.files_dir):
          os.makedirs(this.files_dir)
      }

  // ------------------------------------------------ Model
  load_model(self) {
    const model = this.serializer.read_model()
    if(model==[] || model=={}) {
      return undfined
    }
    return model
  }

    def merge_model(self,context,model):
        """
        Apply Object to the GitWORM, but do not delete
        """
        this.serializer.write_model(model,prune=False)
        this.gitcontrol.match(context.message)

    def assert_model(self,context,model):
        """
        Match the state of the worm to object
        """
        this.serializer.write_model(model,prune=True)
        this.gitcontrol.match(context.message)

    def delete_model(self,context):
        """
        Delete Data from the GitWORM
        """
        this.serializer.write_model({},prune=True)
