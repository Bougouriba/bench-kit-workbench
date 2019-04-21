#!/usr/bin/env python

from distutils.core import setup

setup(
    name='KISIA CLI Toolkit Kernel',
    version='0.1',
    description='KISIA CLI Toolkit Kernel',
    author='Korsimoro',
    author_email='eric@korsimoro.com',
    url='none-yet',
    packages=[
		'kisia_kernel'
		],
    install_requires=[
        'ipykernel'
    ],
    extras_require={
        'dev': [
            'jupyter_kernel_test',
            'sphinx'
             ]
    },
    entry_points = {
    }
)
