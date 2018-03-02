#!/usr/bin/python
 
# Dotfiles - sort_manifest.py w
# Author: Joshua Murphy
# Github: https://github.com/ranguli/dotfiles
# Sorts package manifests alphabetically. Should be run before every time
# manifests are commited.

import sys
usage = "Supply filenames/paths that you want the contents sorted." 

if len(sys.argv) != 1 and sys.argv[1] != '-h' and sys.argv[1] != '--h':
    for i in range(len(sys.argv)):
            filename = sys.argv[i]
            manifest = []
            file = open(filename)
            contents = file.readlines()
    for n, line in enumerate(contents):
        manifest.append(line.rstrip())
    
    manifest.sort()

    file = open(filename, 'w')
    for i in range (0, len(manifest)):
        file.write(manifest[i] + '\n')

else: 
    print(usage)

