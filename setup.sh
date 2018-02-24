# Make sure our scripts sub-repo gets installed
git submodule init
git submodule update
stow scripts

# Install our fonts of choice
mkdir -p ~/.fonts 
wget https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Medium%20for%20Powerline.otf 
wget https://use.fontawesome.com/releases/v5.0.6/fontawesome-free-5.0.6.zip
unzip fontawesome-free-5.0.6.zip
mv ./fontawesome-free-5.0.6/use-on-desktop/Font\ Awesome\ 5\ Free-Regular-400.otf ~/.fonts/
mv "Source Code Pro Medium for Powerline.otf" ~/.fonts
fc-cache -fv

# Configure urxvt and zsh
xrdb -load ~/.Xresources 
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# Install texlive, my LaTeX distrubution of choice
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xvf install-tl-unx.tar.gz
rm install-tl-unx.tar.gz
sudo ./install-tl-20180224/install-tl
rm -r ./install-tl-20180224/

# Danger zone:
sudo su root
echo "blacklist pcspkr" > /etc/modeprobe.d/nobeep.conf # Disable PC speaker
sudo cat ips >> /etc/hosts # Anti ads, analytics, trackers, non-RYF sites

# Setup NetworkManager, nmcli/nmtui for wifi management  
sudo systemctl enable NetworkManager.service

