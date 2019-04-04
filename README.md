# dotfiles

My personal dotfiles.

## Install & Usage:
Install `stow` and `git` then:

`git clone --recursive https://github.com/ranguli/dotfiles && cd ./dotfiles && stow `

To install the package manifest:

`sudo pacman -S $(cat manifest.pacman)`

That will install common packages as well as `yay`. To install our AUR packages: 

`yay --force -S $(cat manifest.yay) ` 

To uninstall: 

`sudo pacman -Rc $(cat blacklist.pacman)`
 
You can clone and copy things manually if you don't have `stow`.

## What are dotfiles?
Dotfiles are a popular text-based method of configuring applications in the UNIX world. A common practice is to track these customized files in a VCS like `git` in order to keep a copy that won't get lost between upgrades, maintain uniformity between machines and provision a new one. We can use a utility called `stow` to easily push or pull the dotfiles onto our systems configuration directory at once.