#!/bin/bash
dotfiles="$(pwd)/"

echo "kwin from this config"

echo "Updating"
sudo pacman -Syu --noconfirm
echo "Installing dependencies"
sudo pacman --noconfirm -S xorg xorg-xinit xterm plasma plasma-desktop plasma-wayland-session kde-applications kdeplasma-addons sddm
sudo pacman --noconfirm -S kitty fish nvim zoxide bat ripgrep fd lazygit eza
{
	echo -n "do you want symlink or copy [cp/ln/n]: "
	read config
	if [ $config == cp ]; then
		cp -r ../.config/fish ~/.config/fish
		cp -r ../.config/kitty ~/.config/kitty
	fi	

	if [ $config == ln ]; then
		rm -rf ~/.config/fish
		rm -rf ~/.config/kitty
		ln -s $dotfiles../.config/fish  ~/.config/	
		ln -s $dotfiles../.config/kitty ~/.config/
	fi
}
{
	echo -e "do you want config \n1. lunarvim \n2. lazyvim \n3. nvim scratch"
       	echo -n "Choose ('numb' / n): "

	read vim 
	if [ $vim == "1" ]; then
		ln -s $dotfiles../.config/lvim ~/.config/
	fi

	if [ $vim == "2" ]; then
		ln -s $dotfiles/../.config/lavim ~/.config/
	fi	
	
	if [ $vim == "3" ]; then
		ln -s $dotfiles../.config/nvim ~/.config/
	fi
}

