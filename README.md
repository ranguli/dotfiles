# dotfiles
Just your everyday dotfile repo, with GNU Stow support.


##about
dotfiles (.file) are a heavily-popular method of configuring things in the UNIX world. From editors like Vim, Emacs, to terminal multiplexers (tmux) to window managers (i3, awm) dotfiles pretty much run the town. The *important* bit is that this repo uses **GNU Stow**, a super simple way of easily installing and uninstalling packages *(but also dotfiles!) as much as you want* no cp'ing and rm'ing and saving and tweaking and resaving. Just bliss.

If you're interested in the package management side of things with Stow, checkout the parent repo, Parakeet: https://www.github.com/ranguli/parakeet, which calls upon this repo to move our dotfiles, while Parakeet compiles and installs packages. 

##install
I told you it was simple. Don't believe me?
`git clone https://github.com/ranguli/dotfiles && cd ./dotfiles && stow  
