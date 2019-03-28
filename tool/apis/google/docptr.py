"""
"""
from services.docptr import DocPtr

class GoogleDrivePointer(DocPtr):
    typecode = "gdrive"

    def __init__(self,name,document_id,mime_type,tags):
        super().__init__(name,tags)
        this.document_id = document_id
        this.mime_type = mime_type

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['docid'],
            ptr_json['mimetype'],
            ptr_json['tags']
        )
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        result['docid'] = self.document_id
        result['mimetype'] = self.mime_type
        return result

class GoogleDocPointer(DocPtr):
    typecode = "gdoc"

    def __init__(self,name,document_id,tags=[]):
        super().__init__(name,tags)
        this.document_id = document_id

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['docid'],
            ptr_json['tags']
        )
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        result['path'] = self.local_path
        return result

class GoogleFolderPointer(DocPtr):
    typecode = "gfolder"

    def __init__(self,name,folder_id,tags=[]):
        super().__init__(name,tags)
        self.folder_id = folder_id

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['folder_id'],
            ptr_json['tags'],
        )
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        result['folder_id'] = self.folder_id
        return result

class GoogleSpreadsheetPointer(DocPtr):
    typecode = "gspreadsheet"

    def __init__(self,name,document_id,tags=[]):
        super().__init__(name,tags)
        self.document_id = document_id

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['docid'],
            ptr_json['tags'],
        )
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        result['docid'] = self.document_id
        return result

class GoogleWorksheetPointer(DocPtr):
    typecode = "gworksheet"

    def __init__(self,name,document_id,sheet_key,tags=[],document_name=None,doc_docptr=None):
        super().__init__(name,tags)
        self.document_id = document_id
        self.sheet_key = sheet_key
        self.document_docptr = doc_docptr
        self.document_name = document_name

    @classmethod
    def hydrate(cls,ptr_json):
        ptr = cls(
            ptr_json['name'],
            ptr_json['doc_id'],
            ptr_json['key'],
            ptr_json['tags'],
            ptr_json['doc_name'] if 'doc_name' in ptr_json else None,
            ptr_json['doc_docptr'] if 'doc_docptr' in ptr_json else None,
        )
        return ptr

    def jsonify(self):
        result = self._get_json_dict()
        result['doc_id'] = self.document_id
        result['doc_name'] = self.document_name
        result['doc_docptr'] = self.document_docptr
        result['key'] = self.sheet_key
        return result
