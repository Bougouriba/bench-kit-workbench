#!/usr/bin/env python

from distutils.core import setup

setup(
    name='gitworm',
    version='0.1',
    description='Git driven Write-Once/Read-Many auditable graph storage',
    author='Korsimoro',
    author_email='eric@korsimoro.com',
    url='none-yet',
    packages=[
		'gitworm',
		'gitworm/serializer',
		'gitworm/gitcontrol'
		],
    install_requires=[
        'PyGitHub'
    ],
    entry_points = {
    }
)
