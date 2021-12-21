#!/bin/sh

echo YAY installer
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
su -c
pacman -S git
cd /opt
git clone https://aur.archlinux.org/yay-git.git
chown -R ./yay-git
exit
cd yay-git
makepkg -si
