#!/bin/sh

echo
echo
echo -------------------------------------------------------------------------------------------------------------------------------------------
echo
echo KJDE automatic installation for Arch based Linux distros
echo
echo !IMPORTANT! Please use this script ONLY on clean install or backup your configs, recommended!------------------------------------!IMPORTANT!
echo !IMPORTANT! Dont run with sudo/doas/as root! Script will install KJDE under /, borked install!-----------------------------------!IMPORTANT!
echo !IMPORTANT! CONFIGURE SUDO/DOAS BEFORE INSTALLING! THE SCRIPT WILL USE IT TO INSTALL YAY AUR HELPER!-----------------------------!IMPORTANT!
echo !IMPORTANT! Ignore error command not found sudo/doas! If you have one of those programs installed!-------------------------------!IMPORTANT!
echo !IMPORTANT! Only systemd and openrc are supported by us! If you have another innit, you will need to enable audio by yourself!---!IMPORTANT!
echo
echo -------------------------------------------------------------------------------------------------------------------------------------------
echo
echo Github.com/kujoDE/KJDE



while true; do
	    read -p "Do you wish to proceed? y/n " yn
	        case $yn in
			        [Yy]* ) make install; break;;
				        [Nn]* ) exit;;
					        * ) echo "Please answer yes or no.";;
						    esac
					    done


sudo pacman -S --noconfirm base-devel
doas pacman -S --noconfirm base-devel
doas pacman -R --noconfirm sudo
sudo pacman -S --noconfirm git
doas pacman -S --noconfirm git
cd git
sudo git clone https://aur.archlinux.org/yay.git
doas git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:$USER ./yay
doas chown -R $USER:$USER ./yay
cd yay
makepkg -si
doas yay -R sudo

#Yes/No yoinked from stackoverflow
mkdir ~/.config
mkdir ~/Pictures

#Creating directories
#.config for configs
#Pictures for wallpapers (after install you can change it in ~/.config/bspwm/bspwmrc/

yay  --noconfirm -Sy

#Updating repositories

                        read -p "Do you want to install pipewire(1) or pulseaudio(2)? If you dont want to have audio pick (0)! 0/1/2   " AUDIO
                            case $AUDIO in
			                0 ) echo hardcore option btw, respect; break;;
                                        1 ) yay  --noconfirm -S pipewire pipewire-pulse pavucontrol; break;;
                                        2 ) yay  --noconfirm -S pulseaudio pavucontrol; break;;
                                        * ) echo "Please answer 0/1/2.";;
                                                            esac

#Pipewire/Pulse

                        read -p "Do you want to install terminal application like cmatrix?(3), no?(4)   " STUFF
                            case $STUFF in
                                        3 ) yay  --noconfirm -S cava cmatrix htop ; break;;
                                        4 ) echo ok; break;;
                                        * ) echo "Please answer 3/4.";;
                                                            esac

#Cmatrix

                        read -p "Which File Manager would you like to install? pcmanfm (5), nautilus (6), dolphin (7), ranger (8), fff (9), nemo (10) or none (11)   " FM
                            case $FM in
                                        5 ) yay  --noconfirm -S pcmanfm ; break;;
                                        6 ) yay  --noconfirm -S nautilus; break;;
                                        7 ) yay  --noconfirm -S dolphin; break;;
                                        8 ) yay  --noconfirm -S ranger; break;;
                                        9 ) yay  --noconfirm -S fff; break;;
                                        10 ) yay  --noconfirm -S nemo; break;;
                                        11 ) echo ok; break;;
                                        * ) echo "Please answer 5/6/7/8/9/10/11";;
                                                            esac
#FileManager

                        read -p "Which terminal emulator would you like to install? alacritty (12), st (13), kitty (14), xfce4-termianl (15), none (16)   " TERMINAL
                            case $TERMINAL in
                                        12 ) yay  --noconfirm -S alacritty; break;;
                                        13 ) yay  --noconfirm -S st; break;;
                                        14 ) yay  --noconfirm -S kitty; break;;
                                        15 ) yay  --noconfirm -S xfce4-terminal; break;;
                                        16 ) echo ok; break;;
                                        * ) echo "Please answer 12/13/14/15/16";;
                                                            esac

#Terminal

                        read -p "Would you like to install Nerd Fonts? This package is required to run pre-installed polybar config. Yes (17), No (18)   " NERD
                            case $NERD in
                                        17 ) yay  --noconfirm -S nerd-fonts-complete; break;;
                                        18 ) echo ok; break;;
                                        * ) echo "Please answer 17/18.";;
                                                            esac

#NerdFonts

                        read -p "Would you like to install web browser? Librewolf (19), Firefox (20), Ungoogled Chromium (21), Vivaldi (22), Epiphany (23), Falkon (24), None (25)   " WEB
                            case $WEB in
                                        19 ) yay  --noconfirm -S librewolf; break;;
                                        20 ) yay  --noconfirm -S firefox; break;;
                                        21 ) yay  --noconfirm -S ungoogled-chromium; break;;
                                        22 ) yay  --noconfirm -S vivaldi; break;;
					23 ) yay  --noconfirm -S epiphany; break;;
					24 ) yay  --noconfirm -S falkon; break;;
					25 ) echo ok; break;;
					* ) echo "Please answer 19/20/21/22/23/24/25.";;
                                                            esac

#WebBrowser

                        read -p "Would you like to install Libre Office? Yes (26), No (27)   " OFFICE
                            case $OFFICE in
                                        26 ) yay -S libreoffice-fresh; break;;
                                        27 ) echo ok; break;;
                                        * ) echo "Please answer 26/27.";;
                                                            esac

#LibreOffice


                        read -p "Which text editor would you like to install? Nano (28), Vim (29), Emacs (30), Gedit (31), none (32)  " TEXT
                            case $TEXT in
                                        28 ) yay -S nano; break;;
                                        29 ) yay -S vim; break;;
					30 ) yay -S emacs; break;;
					31 ) yay -S gedit; break;;
					32 ) echo ok; break;;
                                        * ) echo "Please answer 28/29/30/31/32.";;
                                                            esac


                        read -p "Would you like to install all-repository-fonts package? yes, recommended (32) no (33)  " FOXT
                            case $FOXT in
                                        32 ) yay -S all-repository-fonts; break;;
                                        33 ) echo ok; break;;
                                        * ) echo "Please answer 32/33.";;
                                                            esac




#Adding audio on startup
sudo systemctl enable pulseaudio
sudo systemctl start pulseaudio
sudo rc-service pulseaudio start
sudo rc-update add pulseaudio boot

doas systemctl enable pulseaudio
doas systemctl start pulseaudio
doas rc-service pulseaudio start
doas rc-update add pulseaudio boot

#Pipewire is initialized in kjde.sh 

echo Installing window manager, app launcher, xorg etc.
yay -Syy bspwm picom sxhkd xorg xorg-xinit dmenu feh graphite-gtk-theme lxappearance papirus-icon-theme-git
echo Bspwm Installation complete!

yay -S pkg-config libuv cairo libxcb python3 xcb-proto xcb-util-image xcb-util-wm python-sphinx python-packaging alsa-lib libpulse gcc clan
g git cmake jsoncpp
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cmake ~/polybar
export MAKEFLAGS="-j12"
su -c make install
cd
echo Polybar Installation completed!


#Installing required packages

cp -r ~/KJDE/dotfiles/config/* ~/.config
chmod 777 ~/.config/bspwm/bspwmrc
chmod 777 ~/.config/sxhkd/sxhkdrc
chmod 777 ~/.config/polybar/launch.sh

sudo cp ~/KJDE/dotfiles/kjde.desktop /usr/share/xsessions/kjde.desktop
doas cp ~/KJDE/dotfiles/kjde.desktop /usr/share/xsessions/kjde.desktop
echo Desktop entry for DE coppied!

#WIP

cp ~/KJDE/dotfiles/kjde.sh ~/kjde.sh
cp ~/KJDE/dotfiles/wallp.jpg ~/Pictures/wallp.jpg
echo "exec ~/kjde.sh" >> ~/.xinitrc
chmod 777 ~/kjde.sh

#Coping files to created before directories 
#And creating .xinitrc file

echo x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x
echo
echo Installation complete!
echo
echo Install lightdm bellow, or install other manually
echo 
echo Alternatively use startx command instead
echo
echo Thanks for downloading!
echo - KJDE team
echo
echo x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x~x

                        read -p "Would you like to install ligtdm display manager? OPTIONAL! yes (34), yes but openrc version (35), no (36)  " FOXT
                            case $FOXT in
                                        34 ) yay -S lightdm lightdm-greeter; break;;
					35 ) yay -S lightdm lightdm-greeter lightdm-openrc;break;;
                                        36 ) exit; break;;
                                        * ) echo "Please answer 32/33.";;
                                                            esac


su -c systemctl enable lightdm
su -c rc-update add lightdm boot
echo Lightdm installed succesfully!
#End


