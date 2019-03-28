from .docptr import DocPtr
import os

class WorkspaceFilePointer(DocPtr):
    typecode = "workspace-file"

    def __init__(self,name,local_path,tags = []):
        super().__init__(name,tags)
        self.local_path = local_path

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['path'],
            ptr_json['tags']
        )
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        result['path'] = self.local_path
        return result

class Workspace(object):
    """
    Manages a non-git pool of files that are visible in the development
    scripting space.  These are temporary files that are local, their state
    represents work in progress, and are completely discardable.
    """

    def __init__(self,config,dpm):
        self.config = config
        self.base_dir = config.base_dir
        self.dpm = dpm

    def absolute_path_for(self,path):
        return os.path.abspath(os.path.join(self.base_dir,path))

    def write_file(self,docptr,data):
        """
        Store a file at a path and update metadata in the docptr manager
        """

    def read_file(self,docptr):
        """
        Grab the data (in memory, no worries about large-files or streaming)
        from the file as a direct read - probably bytes.
        """

    def delete_file(self,docptr):
        """
        Delete a workspace file
        """

    def list_files(self):
        """
        Generates a flat list of workspace files - returns the docptrs
        """

    def map_files(self):
        """
        Generates a path-structured dictionary of of workspace files
        """

    def add_file(self,docptr,path,type):
        """
        Path's must be 'slug-sequences'
        """

    def slugify_path(self,path):
        """
        Path's must be 'slug-sequences'
        """

    def change_path(self,docptr,path):
        """
        Changes the docptr path
        """
        docptr = self.docptr_manager.resolveDocPtr(docptr)
        docptr.update_path()
        self.docptr_manager.assert_docptr(docptr)
