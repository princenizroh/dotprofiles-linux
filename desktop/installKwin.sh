#!/bin/bash
dotfiles="$(pwd)/"

{	
	echo "This is Kwin setup"
	echo -n "Do you want to skip the installation? [y/n]: "
	read -r skip

	if [ -z "$skip" ]; then
		echo "Invalid input or empty choice. Existing."
		exit 1
	fi

	if [ $skip != "y" ]; then
		echo "Updating"
		sudo pacman -Syu --noconfirm
		echo "Installing dependencies"
		sudo pacman --noconfirm -S xorg xorg-xinit xterm plasma plasma-desktop plasma-wayland-session kde-applications kdeplasma-addons sddm
		sudo pacman --noconfirm -S kitty fish nvim zoxide bat ripgrep fd lazygit eza
	fi
} || { 
	echo "Error installation" >> failures.log
}

{
	echo "Will be moving configurations for fish and kitty"
	echo -n "Do you want symlink or copy [cp/ln/n]: "
	read -r config

	if [ -z "$config" ]; then
		echo "Invalid input or empty choice. Existing."
		exit 1
	fi

	if [ "$config" == "cp" ]; then
		echo "Copying configurations"
		cp -r "$dotfiles../.config/fish" ~/.config/fish
		cp -r "$dotfiles../.config/kitty" ~/.config/kitty
	fi	

	if [ "$config" == "ln" ]; then
		echo "Removing existing configurations"
		rm -rf ~/.config/fish
		rm -rf ~/.config/kitty
		
		echo "Creating symlinks"
		ln -s "$dotfiles../.config/fish"  ~/.config/	
		ln -s "$dotfiles../.config/kitty" ~/.config/
	fi
}

{	
	echo -e "Do you want additional configurations?"
	echo -e "1. lunarvim\n2. lazyvim\n3. nvim scratch\nn. No additional configurations"
       	echo -n "Choose ('numb'/n): "
	read -r vim

	if [ -z "$vim" ]; then
		echo "Invalid input or empty choice. Exiting."
		exit 1
	fi

	case $vim in 
		"1") echo "Creating symlink for lunarvim"; ln -s "$dotfiles../.config/lvim" ~/.config/ ;;
		"2") echo "Creating symlink for lazyvim"; ln -s "$dotfiles../.config/lavim" ~/.config/ ;;
		"3") echo "Creating symlink for nvim scratch"; ln -s "$dotfiles../.config/nvim" ~/.config/ ;;
		"n") echo "No additional configurations. See ya" ;;
		*) echo "Invalid option" ;;
	esac
}

