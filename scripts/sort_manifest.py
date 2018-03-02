#!/usr/bin/python
 
# Dotfiles - sort_manifest.py 
# Author: Joshua Murphy
# Github: https://github.com/ranguli/dotfiles
# Sorts package manifests alphabetically. Should be run before every time
# manifests are commited.

import sys

for i in range(1, len(sys.argv)):
    filename = sys.argv[i]
    file = open(filename)
    contents = file.readlines()
    
    contents.sort()
    print(len(contents))
    file = open(filename, 'w')

    for x in range(len(contents)):
        line = (contents[x])
        print(line)
        file.write(line)
