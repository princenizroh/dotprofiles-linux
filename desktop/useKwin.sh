#!/bin/bash

echo "kwin from this config"

echo "Updating"
sudo pacman -Syu --noconfirm
echo "Installing dependencies"
sudo pacman --noconfirm -S xorg xorg-xinit xterm plasma plasma-desktop plasma-wayland-session kde-applications kdeplasma-addons sddm
sudo pacman --noconfirm -S kitty fish nvim zoxide bat ripgrep fd lazygit eza
{	
	echo -n "do you want symlink or copy [cp/ln/no]"
	read config
	if [ $config == cp ]; then
		cp -r ../.config/fish ~/.config/fish
	fi	
	rm -rf ~/.config/fish
	rm -rf ~/.config/kitty
	if [ $config == ln ]; then
		ln -s ../.config/fish  ~/.config/	
	fi
}

