"""
GitHub Repository Configuration
"""
from services.docptr import DocPtr

class RepositoryFilePointer(DocPtr):
    typecode = "rfile"

    def __init__(self,name,tags = []):
        super(name,tags)

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['tags'],
        )
        #TODO repo specific fields
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        return result

class Repository(object):
    def __init__(self):
        self.url = null
        self.slug = null
        self.organization = null
        self.name = null


class GitHubConfiguration(object):
    # 32b154fbacad3ae2b3bb33ff39d5e949e2ca1c55
    pass
