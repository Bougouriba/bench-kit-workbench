"""
This file
"""

class SlugAliases(object):
    def __init__(self,alias_defn):
        self.aliases = set()
        self.slug = alias_defn['slug']
        for x in alias_defn['aliases']:
            self.aliases(x)

    def match(self,test):
        if test == self.slug:
            return True
        if test in self.aliases:
            return True
        return False

class ElementTypeMatcher(object):

    def __init__(self,matcher_defn):
        self.type = matcher_defn['type']
        self.match_map = {}
        for key,vals in matcher_defn['match_map']:
            skey = slugify(key)
            self.match_map[skey] = set()
            for x in vals:
                self.match_map[skey].add(slugify(x))
         in detector_defn['matchers']:
            self.aliases(x)

    def match(self,test_record):
        normalized_record = {}
        for key,value in test_record.items():
            skey = slugify(key)
            svalue = slugify(value)
            normalized_record[skey] = svalue

        for key,vals in self.match_map.items():
            if not key in self.normalized_record.keys():
                return False
            obj_value = self.normalized_record[key]
            if not obj_value in vals:
                return False

        return True


class ElementTypeDetector(object):
    def __init__(self,detector_defn):
        self.slug = detector_defn['slug']
        self.matchers = list()


    def match(self,test):
        if test == self.slug:
            return True
        if test in self.aliases:
            return True
        return False
