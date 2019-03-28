KISIA Toolkit
=======================

## Prereqs
- python3
- pip3
- virtualenv

These should be installed however is appropriate to your system and should
be available in your PATH.

## Set up the environment
```
git clone git@github.com:korsimoro/contractors
kisia/toolkit/python/install.sh
```

## Activate a development environment
```
. kisia/toolkit/python/dev.sh
```
this will:
- activate the virtualenv
- pip install the current package with the --editable flag
- cd into the development directory

You can now run the command as ```tool```

## Documentation
* Run ```make html``` and open the file _build/html/genindex.html
* Much todo on the doc front, only basic skeleton in place
