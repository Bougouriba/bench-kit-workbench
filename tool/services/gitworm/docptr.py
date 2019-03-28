"""
Contains the information relating to the gitworm checkout containing
the kisia gitworm checkout data.
"""
from services.docptr import DocPtr

class GitWormFilePointer(DocPtr):
    typecode = "rfile"

    def __init__(self,name,tags = []):
        super(name,tags)

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['tags'],
        )
        #TODO gitworm specific fields
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        return result

class GitWormModelPointer(DocPtr):
    typecode = "rfile"

    def __init__(self,name,tags = []):
        super(name,tags)

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['tags'],
        )
        #TODO gitworm specific fields
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        return result
