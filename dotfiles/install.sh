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

while true; do
	    read -p "Do you wish to proceed? y/n " yn
	        case $yn in
			        [Yy]* ) make install; break;;
				        [Nn]* ) exit;;
					        * ) echo "Please answer yes or no.";;
						    esac
					    done

#Yes/No yoinked from stackoverflow

mkdir ~/.config
mkdir ~/Pictures

#Creating directories
#.config for configs
#Pictures for wallpapers (after install you can change it in ~/.config/bspwm/bspwmrc/

yay -Sy

#Updating repositories

                        read -p "Do you want to install pipewire(1) or pulseaudio(2)? 1/2 " AUDIO
                            case $AUDIO in
                                        1 ) yay -S pipewire pipewire-pulse; break;;
                                        2 ) yay -S pulseaudio; break;;
                                        * ) echo "Please answer 1/2.";;
                                                            esac
done

#Pipewire/Pulse

                        read -p "Do you want to install terminal application like cmatrix?(3), no?(4) " STUFF
                            case $STUFF in
                                        3 ) yay -S cava cmatrix htop ; break;;
                                        4 ) echo ok; break;;
                                        * ) echo "Please answer 3/4.";;
                                                            esac
done

#Cmatrix

                        read -p "Which File Manager would you like to install? pcmanfm (5), nautilus (6), dolphin (7), ranger (8), fff (9), nemo (10) or none (11)" FM
                            case $FM in
                                        5 ) yay -S pcmanfm ; break;;
                                        6 ) yay -S nautilus; break;;
                                        7 ) yay -S dolphin; break;;
                                        8 ) yay -S ranger; break;;
                                        9 ) yay -S fff; break;;
                                        10 ) yay -S nemo; break;;
                                        11 ) echo ok; break;;
                                        * ) echo "Please answer 5/6/7/8/9/10/11";;
                                                            esac
done

#FileManager

                        read -p "Which terminal emulator would you like to install? alacritty (12), st (13), kitty (14), xfce4-termianl (15), none (16)" TERMINAL
                            case $TERMINAL in
                                        12 ) yay -S alacritty; break;;
                                        13 ) yay -S st; break;;
                                        14 ) yay -S kitty; break;;
                                        15 ) yay -S xfce4-terminal; break;;
                                        16 ) echo ok; break;;
                                        * ) echo "Please answer 12/13/14/15/16";;
                                                            esac
done

echo Installing window manager, app launcher, xorg etc.
yay -Syy bspwm picom polybar sxhkd xorg xorg-xinit dmenu feh nerd-fonts-complete


#Installing required packages

cp -r ~/KJDE/dotfiles/config/* ~/.config
sudo cp ~/KJDE/dotfiles/kjde.desktop /usr/share/xsessions/kjde.desktop
doas cp ~/KJDE/dotfiles/kjde.desktop /usr/share/xsessions/kjde.desktop
cp ~/KJDE/dotfiles/kjde.sh ~/kjde.sh
cp ~/KJDE/dotfiles/wallp.jpg ~/Pictures/wallp.jpg
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


