# dotfiles
Just your everyday dotfile repo, with GNU Stow support.


## What are dotfiles?
Dotfiles (i.e:   .examplefile) are text-based files that are a hugely popular method of configuring applications in the UNIX world. Most UNIX software has some kind of configuration file that it relies on. We can create peronalized configurations of the software we use to increase productivity or tailor to preference. A common practice is to "track" these files in a VCS like `git` in order to share with others, keep a copy that won't get lost between upgrades, maintain uniformity between your laptop and desktop, quickly provision a new machine, and to keep branches of your dotfiles that are guranteed to work vs. your experimental configs. We can take this another step further however, by using a utility called `stow` to easily push or pull the dotfiles onto our systems configuration directory at once.

## How do I install?
Using `stow` and `git`. Grab it from your OS package manager (`apt`, `brew`, `pacman`, `yum` , etc) before proceeding. 

Acquire and move into the git repository, then stow all the files with:

`git clone https://github.com/ranguli/dotfiles && cd ./dotfiles && stow `


### Common Installation Errors

**Tip:** *Stow will get confused if it sees existing dotfiles on your system.* Here's an example warning of trying to stow a dotfile when one of the same name already exists on our system.

`WARNING! stowing zsh would cause conflicts:     
existing target is neither a link nor a directory: .zprofile                                
All operations aborted. `

Backup the file:

`mkdir ~/backup`
`cd ~/ `
`cp ./.zprofile ~/backup `

Then try stow again.

## Further reading:
GNU Stow

Git

Package Managers

