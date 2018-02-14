mkdir -p ~/.fonts 
wget https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Medium%20for%20Powerline.otf 
mv "Source Code Pro Medium for Powerline.otf" ~/.fonts
fc-cache -fv

xrdb -load ~/.Xresources 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
stow zsh

