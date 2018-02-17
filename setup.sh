stow scripts

mkdir -p ~/.fonts 
wget https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Medium%20for%20Powerline.otf 
wget https://use.fontawesome.com/releases/v5.0.6/fontawesome-free-5.0.6.zip
unzip fontawesome-free-5.0.6.zip
mv ./fontawesome-free-5.0.6/use-on-desktop/Font\ Awesome\ 5\ Free-Regular-400.otf ~/.fonts/
mv "Source Code Pro Medium for Powerline.otf" ~/.fonts
fc-cache -fv

xrdb -load ~/.Xresources 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
stow zsh

