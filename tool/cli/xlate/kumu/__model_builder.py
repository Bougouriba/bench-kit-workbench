from slugify import slugify

class Element(object):

    def __init__(self):
        pass

class Connection(object):

    def __init__(self):
        pass

class ConnectionDefinition(object):

    def __init__(self,record):
        self.raw_from = None
        self.raw_to = None
        self.slug_attrs = {}
        for key,value in record.items():
            skey = slugify(key)
            if skey == 'from':
                self.raw_from = key
            if skey == 'to':
                self.raw_to = key
            self.slug_attrs[skey] = value


class ElementDefinition(object):

    def __init__(self):
        pass

class ElementExtensionDefinition(object):

    def __init__(self):
        pass
