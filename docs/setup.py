#!/usr/bin/env python

from distutils.core import setup

setup(
    name='KIT Workbench Docs',
    version='0.1',
    description='KIT Workbench Docs Utility',
    author='Korsimoro',
    author_email='eric@korsimoro.com',
    url='none-yet',
    packages=[
        'doctool'
    ],
    install_requires=[
        'click',
        'PyYAML',
        'mkdocs'
    ],
    entry_points = {
        'console_scripts': ['doctool=doctool:cli'],
    }
)
