#!/usr/bin/python

# Joshua Murphy, 2018. Licensed under the GNU GPLv3.
# https://github.com/ranguli/dotfiles
# sort_manifest.py: Sorts package manifests alphabetically. 

import sys
for i in range(1, len(sys.argv)):
    with open (sys.argv[i], 'r+') as f:
        c = f.readlines()
        c.sort()
        f.seek(0,0)
        f.writelines(c)
