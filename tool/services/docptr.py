"""
Management of the configuration system
"""
import random
import string
import time
import json
def get_new_pointer_id():
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))

class DocPtr(object):
    """
    Points to a document, somewhere, with a given type and relevant metadata.

    \b
    Internals:
    * the id is used in the system audit trail, if an object is being created
      for the first time, one is assigned randomly.  It must be preserved if
      it is being hydrated.

    """
    def __init__(self,name,tags=[]):
        self.name = name
        self.tags = tags
        # assign a new
        self.id = get_new_pointer_id()
        self.ctime = time.time()

    def _get_json_dict(self):
        ptr_json = dict()
        ptr_json['id'] = self.id
        ptr_json['name'] = self.name
        ptr_json['type'] = self.__class__.typecode
        ptr_json['tags'] = self.tags
        ptr_json['ctime'] = self.ctime
        return ptr_json

    def _hydrate_from_dict(self,ptr_json):
        self.id = ptr_json['id'] = self.id
        self.name = ptr_json['name'] = self.name
        if self.__class__.typecode != ptr_json['type']:
            raise Exception("Attempt to create %s using class %s" % \
                                (ptr_json['type'],self.__class__.typecode))

        self.tags = ptr_json['tags']
        self.ctime = self.ctime

    #// ABC implementation
    def hydrate(self,ptr_json):
        self._hydrate_from_dict(ptr_json)

    #// ABC implementation
    def jsonify(self):
        result = self._get_json_dict()
        return result


class PublicWebPointer(DocPtr):
    typecode = 'web'

    """
    Points to a document on the web, not requiring any authentication
    """
    def __init__(self,url):
        self.url = url

    @property
    def url(self):
        return self._url

    @url.setter
    def url(self,value):
        self.info = urllib.parse(value)
        self._url = value

    def hyrate(self,ptr_json):
        self._hydrate_from_dict(ptr_json)
        self.url = ptr_json['url']

    def jsonify(self):
        result = self._get_json_dict()
        result['url'] = self.url
        return result


from apis.google.docptr import GoogleDrivePointer,GoogleFolderPointer,GoogleDocPointer,GoogleSpreadsheetPointer,GoogleWorksheetPointer
from apis.github.docptr import RepositoryFilePointer
from services.gitworm.docptr import GitWormFilePointer
import services.workspace

class DocPtrManager(object):

    def _initialize_hydration_registry(self):
        """create index of docptr type values to JSON
        deserialization methods"""
        self.hydration_registry = dict()
        def add(cls):
            self.hydration_registry[cls.typecode] = cls.hydrate
        add(GoogleDrivePointer)
        add(GoogleDocPointer)
        add(GoogleSpreadsheetPointer)
        add(GoogleWorksheetPointer)
        add(GoogleFolderPointer)
        add(RepositoryFilePointer)
        add(GitWormFilePointer)
        add(PublicWebPointer)
        add(services.workspace.WorkspaceFilePointer)

    def __init__(self,config):
        self.config = config
        self.active = {}
        self.retired = []
        self._initialize_hydration_registry()

        # now restore the config web of docptrs
        for ptr_json in config.active:
            ptr = self.hydrate_docptr(ptr_json)
            self.active[ptr.name] = ptr

        self._reindex_model()

    def _reindex_model(self):
        self.models = {}
        # now restore the config web of docptrs
        for ptr in self.active.values():
            for tag in ptr.tags:
                if not tag in self.models:
                    self.models[tag] = []
                self.models[tag].append(ptr)

    def hydrate_docptr(self,ptr_json):
        """given a docptr JSON description, map it into the correct
        internal"""
        type = ptr_json['type']
        if type in self.hydration_registry.keys():
            ctor = self.hydration_registry.get(type)
            return ctor(ptr_json)
        else:
            raise Exception("hydrate_docptr(%s) did not recognize type" % type)


    # Doc Ptrs
    def assertDocPtr(self,docptr):
        """
        Assert document pointer state.  If a docptr does not exist, add
        it.  If it does exist, then update the relevant information.
        """
        current_ptr = self.resolveDocPtr(docptr.name)
        if current_ptr == None:
            self.active[docptr.name] = docptr
        else:
            self.active[docptr.name] = docptr
        self.config.assertDocPtr(docptr)
        self._reindex_model()

    def retire(self,docptr):
        """
        Look up a docptr_id and retun the docptr if found.
        """
        del self.active[docptr.name]
        self.config.retractDocPtr(docptr)
        self._reindex_model()

    def resolveDocPtr(self,docptr_id,type=None):
        """
        Look up a docptr_id and retun the docptr if found.
        """
        if docptr_id in self.active:
            ptr = self.active[docptr_id]
            if type != None and ptr.typecode != type :
                return None
            return ptr
        return None


    def listActiveDocPtrs(self):
        """
        Get all the active docptrs
        """
        for v in self.active.values():
            yield v

    def resolveUsing(self,using):
        """
        Return a set of docptrs identified by using.
        """
        if using in self.models:
            return self.models[using]
        return None
