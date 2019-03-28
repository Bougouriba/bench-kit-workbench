
import os
import click
from .config import KISIA_Config
from .docptr import DocPtrManager
from .output import OutputControl
from .workspace import Workspace,WorkspaceFilePointer
from slugify import slugify

class PathClassification(object):

    def __init__(self):
        self._empty = True
        self._stdpipe = False
        self._absolute_path = None
        self._docptr = None

    @classmethod
    def empty(cls):
        return PathClassification()

    @classmethod
    def pipe(cls):
        pc = PathClassification()
        pc._absolute_path = None
        pc._empty = False
        pc._stdpipe = True
        pc._docptr = None
        return pc

    @classmethod
    def fromDocPtr(cls,ptr,path):
        pc = PathClassification()
        pc._absolute_path = path
        pc._empty = False
        pc._stdpipe = False
        pc._docptr = ptr
        return pc

    @classmethod
    def fromAbsolutePath(cls,path):
        pc = PathClassification()
        pc._absolute_path = path
        pc._empty = False
        pc._stdpipe = False
        pc._docptr = None
        return pc

    @property
    def is_empty(self):
        """Is this an empty or unspecified path?"""
        return self._empty

    @property
    def is_stdpipe(self):
        """Is this an empty or unspecified path?"""
        return self._stdpipe

    @property
    def absolute_path(self):
        return self._absolute_path

    @property
    def is_docptr(self):
        return self._docptr != None

    @property
    def docptr(self):
        return self._docptr

class Application(object):


    def log(self, msg, *args):
        """Logs a message to stderr."""
        if args:
            msg %= args
        click.echo(msg, file=sys.stderr)

    def vlog(self, msg, *args):
        """Logs a message to stderr only if verbose is enabled."""
        if self.verbose:
            self.log(msg, *args)

    def __init__(self,ctx,verbose,config_path):
        self.ctx = ctx
        self.verbose = verbose
        self.config = KISIA_Config(config_path)
        self.output = OutputControl()
        self.dpm = DocPtrManager(self.config.docptr)
        self.workspace = Workspace(self.config.workspace,self.dpm)


        def abort(msg):
            click.echo(msg)
            ctx.abort()
        self.abort = abort

    def classifyPath(self,path):
        if path == None:
            return PathClassification.empty()
        elif path == '-':
            return PathClassification.pipe()
        elif path.startswith("w:"):
            # workspace docptr
            name = path[2:]
            ptr = self.dpm.resolveDocPtr(name)
            if ptr == None:
                slug = slugify(name)
                ptr = WorkspaceFilePointer(slug,name)
                self.dpm.assertDocPtr(ptr)
                abspath = self.workspace.absolute_path_for(ptr.local_path)
                return PathClassification.fromDocPtr(ptr,abspath)
            else:
                if isinstance(ptr,WorkspaceFilePointer):
                    abspath = self.workspace.absolute_path_for(ptr.local_path)
                    return PathClassification.fromDocPtr(ptr,abspath)
                else:
                    return PathClassification.empty()
        elif path.startswith("/"):
            # absolute path
            return PathClassification.fromAbsolutePath(os.path.abspath(path))
        elif path.startswith("w/") or path.startswith("./"):
            abspath = self.workspace.absolute_path_for(path[2:])
            return PathClassification.fromAbsolutePath(abspath)
        else:
            ptr = self.dpm.resolveDocPtr(path)
            if ptr != None:
                abspath = self.workspace.absolute_path_for(ptr.local_path)
                return PathClassification.fromDocPtr(ptr,abspath)
            else:
                return PathClassification.fromAbsolutePath(os.path.abspath(path))
