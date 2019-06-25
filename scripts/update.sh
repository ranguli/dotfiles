#!/bin/sh
echo "Run as root!"
emerge --sync
emerge -avuDN --with-bdeps=y @world
etc-update
emerge -pv --depclean
revdep-rebuild
eclean -d distfiles
