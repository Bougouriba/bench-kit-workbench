import github
import os
import json
import re
import shutil
from jsonspec.pointer import extract, Pointer

class Loader(object):
    def __init__(self,path):
        self.seen = dict()
        self.root = None
        self.path = path
        self.visit_list = []

    def load(self):
        def set_root(value):
            self.root = value
        self.visit_list = [("",set_root)]
        while True:
            if len(self.visit_list) == 0:
                break
            (datum_path,assigner) = self.visit_list.pop(0)
            assigner(self.load_object(datum_path))

        return self.root

    def load_object(self,object_path):
        def see_object(value):
            self.seen[object_path] = value
            #print("SEE:",id(value),object_path)

        full_object_file_path = self.path + object_path
        if os.path.isfile(full_object_file_path):
            with open(full_object_file_path,'r') as fin:
                value = json.load(fin)
                see_object(value)
                return value
        else:
            # is this an 'array'? with only integer indices
            elts = set()
            contains_non_numerics = False
            for elt in os.listdir(full_object_file_path):
                if elt[0] != '.':
                    if elt == '$ref':
                        with open(full_object_file_path+'/$ref','r') as fin:
                            ref_path = json.load(fin)
                            if ref_path not in self.seen:
                                print("ERROR",ref_path,full_object_file_path)
                            value = self.seen[ref_path]
                            see_object(value)
                            return value
                    else:
                        match = re.search(r'(\d+)?',elt)
                        index_str = match.group(1)
                        if index_str == None:
                            contains_non_numerics = True
                        elts.add(elt)
            elts = list(elts)
            elts.sort()

            def create_setter(value,elt):
                def set_elt(x):
                    value[elt] = x
                return set_elt

            # create correct object
            if contains_non_numerics:
                value = dict()
                see_object(value)
                for elt in elts:
                    path = object_path + "/" + elt
                    self.visit_list.append((path,create_setter(value,elt)))
            else:
                value = [None] * len(elts)
                see_object(value)
                for elt in elts:
                    path = object_path + "/" + elt
                    self.visit_list.append((path,create_setter(value,int(elt))))

            return value

class Serializer(object):

    def __init__(self,path):
        self.path = path


    def read_model(self):
        loader = Loader(self.path)
        return loader.load()

    def write_model(self,model,prune=False):
        path = self.path
        if path.endswith("/"):
            path = path[-1:]
        path_list = dict()
        seen = dict()
        visit_list = [(model,"")]

        def visit(datum,datum_path):
            """
            """
            oid = id(datum)
            if oid in seen:
                # we've seen this, so return a reference
                path_list[datum_path+"/$ref"] = seen[oid]
            else:
                seen[oid] = datum_path

                if type(datum) is dict:
                    for key in datum:
                        visit_list.append((datum[key],datum_path+"/"+key))
                else:
                    if not type(datum) is list:
                        path_list[datum_path] = datum
                    else:
                        if len(datum) == 0:
                            path_list[datum_path] = datum
                        else:
                            index = 0
                            for value in datum:
                                visit_list.append((value,datum_path+"/%d" % index))
                                index = index + 1

        while True:
            if len(visit_list) == 0:
                break
            (obj,datum_path) = visit_list.pop(0)
            visit(obj,datum_path)

        # find files, these will be potentially deleted
        to_delete = set()
        for (dirpath,dirnames,filenames) in os.walk(path):
            dirnames[:] = [d for d in dirnames if not d.startswith('.')]
            for dn in dirnames:
                pass
            for fn in filenames:
                key = dirpath + "/" + fn
                to_delete.add(key)

        # write model to filesystem, remove anything written from the
        # tentative deletion list
        for jpath,value in path_list.items():
            full_path = self.path + jpath
            if full_path in to_delete:
                to_delete.remove(full_path)
            (dirpath,delim,fname) = full_path.rpartition('/')
            if not os.path.exists(dirpath):
                os.makedirs(dirpath)
            else:
                if os.path.isfile(dirpath):
                    os.remove(dirpath)
                    os.makedirs(dirpath)
            if os.path.exists(full_path):
                if os.path.isdir(full_path):
                    shutil.rmtree(full_path)
            with open(full_path,'w') as f:
                json.dump(value,f)

        # if pruning, then delete anything we need to delete
        if prune:
            for s in to_delete:
                if os.path.exists(s):
                    if os.path.isfile(s):
                        os.remove(s)
                    else:
                        shutil.rmtree(s)
            while True:
                count = 0
                for (dirpath,dirnames,filenames) in os.walk(path):
                    dirnames[:] = [d for d in dirnames if not d.startswith('.')]
                    for dn in dirnames:
                        dp = dirpath + "/" + dn
                        if len(os.listdir(dp)) == 0:
                            os.rmdir(dp)
                            count = count + 1
                    for fn in filenames:
                        pass
                if count == 0:
                    break
