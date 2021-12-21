#!/bin/sh

echo
echo
echo ---------------------------------------------------------------------------------------------------------
echo
echo KJDE automatic installation for arch based distros
echo
echo !IMPORTANT! Please install yay aur helper before installing! Scipt will install pkgs from AUR! !IMPORTANT!
echo !IMPORTANT! Please use this script ONLY on clean install or backup your configs, recommended! !IMPORTANT!
echo !IMPORTANT! Dont run with sudo/doas/as root! Script will install KJDE under /, borked install! !IMPORTANT!
echo
echo ---------------------------------------------------------------------------------------------------------
echo
echo
#
#while true; do
#	    read -p "Do you wish to proceed? y/n " yn
#	        case $yn in
#			        [Yy]* ) make install; break;;
#				        [Nn]* ) exit;;
#					        * ) echo "Please answer yes or no.";;
#						    esac
#					    done
#
#Yes/No yoinked from stackoverflow

mkdir ~/.config
mkdir ~/Pictures

#Creating directories
#.config for configs
#Pictures for wallpapers (after install you can change it in ~/.config/bspwm/bspwmrc/

yay -Sy

#Updating repositories

yay -Syy pipewire-alsa pipewire pipewire-pulse pipewire-jack bspwm alacritty cava cmatrix htop treefetch librewolf pcmanfm picom polybar sxhkd xorg xorg-xinit dmenu feh all-repository-fonts nerd-fonts-complete


#Installing required packages

cp -r ~/dotfiles/config/* ~/.config
sudo cp ~/dotfiles/kjde.desktop /usr/share/xsessions/kjde.desktop
doas cp ~/dotfiles/kjde.desktop /usr/share/xsessions/kjde.desktop
cp ~/dotfiles/kjde.sh ~/kjde.sh
cp ~/dotfiles/wallp.jpg ~/Pictures/wallp.jpg
echo "exec ~/kjde.sh" >> ~/.xinitrc

#Coping files to created before directories 
#And creating .xinitrc file

echo x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x
echo
echo Installation complete!
echo
echo If you want to install display manager, do it now
echo If not, use startx command instead, recommended
echo
echo x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x


#End


