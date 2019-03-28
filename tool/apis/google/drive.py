"""
Google Drive API Bridge
"""

import apis.google as google
from googleapiclient.http import MediaIoBaseUpload
from io import BytesIO
import re
from googleapiclient.discovery import build

import json

class itis(object):
    re_folderid = r'[-\w]{33}'
    subre_fileid = r'[-\w]{44}'
    re_fileid = r'^%s' % subre_fileid
    re_filename = r'^.*$'
    re_fileurl = (r'^https://(?P<app>\w*?)\.google.com/'  # domain name component
                  r'(?P<type>\w*?)/d/(?P<fileid>%s)'      # path component
                  r'(?:/[^#]*)?'                          # anything until hash component (#)
                  r'(?:#gid=(?P<gid>\d*))?'               # gid component
                  r'(?P<suffix>.*)'                       # everything after
                  % subre_fileid)

    @classmethod
    def fileid(cls, string):
        """Returns string if string is a google drive file id, False otherwise"""
        return string if re.match(cls.re_fileid, string) else False

    @classmethod
    def folderid(cls, string):
        """Returns string if string is a google drive folder id, False otherwise"""
        return string if re.match(cls.re_folderid, string) else False

    @classmethod
    def fileurl(cls, string):
        """Returns informational dict if string is a google drive file url, False otherwise"""
        try:
            return re.match(cls.re_fileurl, string).groupdict()
        except AttributeError:
            return False


class GoogleDrive(object):

    def __init__(self,creds):
        self.drive = build('drive', 'v3', credentials=creds)

    def delete_file(self,file_id):
        return self.drive.files().delete(fileId=file_id).execute()

    def replace_gdoc_from_html(self,file_id, content):
        """
        Creates or updates a gdoc with the given content (HTML).
        Clears and updates the doc if the filename_or_fileid is a gdrive file id,
        creates the sheet with filename otherwise.
        Example usages: r=to_doc('My Doc', '<h1>Hello world</h1>')
                        r=to_doc('1v0Oh74BMNgJruvumgX9u9SPRsDnAjrClckUlcpOtU8s', '<h1>Hello world</h1>')
        """
        media_body = MediaIoBaseUpload(BytesIO(bytes(content, 'utf-8')),
                                       mimetype='text/html')
        return self.drive.files().update(fileId=file_id, media_body=media_body).execute()


    def get_file_content(self,file_id, mime_type='text/html'):
      """
      Returns content of file specified by file_id.
      Example usage: get_file_content('1gfIz5TT0cNp2kxGMLFXr19x1uoZsruUe_0glHst2fZ8', mime_type='text/html')
      """
      ## from https://developers.google.com/drive/api/v2/reference/files/get#examples
      return self.drive.files().export(fileId=file_id, mimeType=mime_type).execute()

    # TODO: add a parent file_id so that we can put this in a specific folder
    def create_file(self,filename, file_mimetype=None, body_content=None, body_mimetype=None):
        """Creates a file according parameters.
        Example usage: create_file('Name', 'application/vnd.google-apps.spreadsheet')
        Args:
            filename: The filename to be created.
            file_mimetype: The mimetype of the created file.
            body_content: The body content of the file to be created.
            body_mimetype: The body content mimetype.
        """
        body = {'mimeType': file_mimetype,
                'name': filename}
        if body_content:
            if not body_mimetype:
                raise TypeError('body_content argument implies a mandatory body_mimetype argument')
            media_body = MediaIoBaseUpload(BytesIO(bytes(body_content, 'utf-8')),
                                           mimetype=body_mimetype)
        else:
            media_body = None
        return self.drive.files().create(body=body, media_body=media_body).execute()

    def get_children(self,fileid,depth=10000,path='/',type=None):
        if depth <= 0:
            return []
        results = self.drive.files().list(q='trashed=false and "%s" in parents' % fileid,pageSize=1000, fields="nextPageToken, files(id, name,mimeType)").execute()
        items = results.get('files', [])

        if not items:
            return []
        else:
            values = []
            for item in items:
                #print(json.dumps(item,indent=4,sort_keys=True))
                newpath = path + item['name'] + '/';
                item['folderPath'] = path
                if type == None:
                    values.append(item)
                else:
                    if item['mimeType'] == 'application/vnd.google-apps.' + type:
                        values.append(item)
                if item['mimeType'] == 'application/vnd.google-apps.folder':
                    values.extend(self.get_children(item['id'],path=newpath,depth = depth - 1,type=type))

            return values
