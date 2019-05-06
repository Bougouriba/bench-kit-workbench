#!/usr/bin/env python

from distutils.core import setup

setup(
    name='KIT Workbench',
    version='0.1',
    description='KIT Workbench',
    author='Korsimoro',
    author_email='eric@korsimoro.com',
    url='none-yet',
    packages=[
    ],
    install_requires=[
		'jupyter',
		'pandas',
		'json-spec'
    ],
    entry_points = {
        'console_scripts': ['doctool=doctool:cli'],
    }
)
