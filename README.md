# dotfiles
My personal dotfiles, currently for Fedora. Now with GNU Stow support.

## Install & Usage:
Install `stow` and `git` then:

`git clone --recursive https://github.com/ranguli/dotfiles && cd ./dotfiles && stow `

To install the package manifest, run ` sudo pacman -S $(cat manifest.pacman) `
This will install common packages as well as `pacaur`, which is my AUR helper of choice. Run:
` pacaur -S $(cat manifest.pacuar) ` to install the AUR packages of choice.

I prefer this method of keeping track of my packages over using `pacman` to output a manifest because it's cumbersome and 
keeps track of *every* package and their version, 85% of which I don't care about and are installed by default. It's also more cumbersome to manually update that exported file.
 
Or clone and copy things manually if you don't have `stow`.

## What are dotfiles?
Dotfiles are text-based files that are a hugely popular method of configuring applications in the UNIX world, named for the fact that they generally follow the convention of starting with a `.` and then the filename. Most UNIX software has some kind of configuration file that it relies on. We can create peronalized configurations of the software we use to increase productivity or tailor to preference. A common practice is to track these files in a VCS like `git` in order to share with others, keep a copy that won't get lost between upgrades, maintain uniformity between your laptop and desktop, quickly provision a new machine, and to keep branches of your dotfiles that are guranteed to work vs. experimental configs. We can take this another step further however, by using a utility called `stow` to easily push or pull the dotfiles onto our systems configuration directory at once.




