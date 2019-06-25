#!/usr/bin/bash

# Joshua Murphy, 2018. Licensed under the GNU GPL v3.
# https://github.com/ranguli/dotfiles
# setup.sh: Distro-agnostic script for new installs. 

# Install our shell 
function install_shell {
  ./scripts/install_shell.sh
}
# Install our fonts of choice
function install_fonts {
  ./scripts/install_fonts.sh
}

# Install LaTeX typesetting software
function install_latex {
  ./scripts/install_latex.sh
}

function thinkpad_tweaks {
  ./scripts/thinkpad_tweaks
}

#cat ips >> /etc/hosts # Anti ads, analytics, trackers, non-RYF sites
# Setup NetworkManager, nmcli/nmtui for eth/wifi management  
#systemctl enable NetworkManager

### Uncomment which functionality you desire: 
# install_fonts
# install_latex
# thinkpad_tweaks
# install_shell
