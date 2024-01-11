#!/bin/bash
cat <<"EOF"

-------------------
        .                                                     
       / \         
      /^  \      
     /  _  \    
    /  | | ~\     
   /.-'   '-.\                                  

-------------------

EOF

echo "Need installation for sudo!!"
echo "This is installation package for arch installation"
echo -e "1. System \n2. Desktop\n3. Grub \n4. Utilities packages \n5. Repo installer"
echo -n "What do you want to install? ['numb'/n]: "
read -r install

if [ -z "$install" ]; then
	echo "Invalid input or empty choice. Exiting."
	exit 1
fi

case $install in
	1) # System Installation
		echo "Install arch package to root partition"
		echo "Before instalation update keyring"

		pacman -Sy archlinux-keyring && pacman -Syyu
		pacstrap -i /mnt base base-devel linux linux-lts linux-headers linux-firmware intel-ucode sudo nano vim git neofetch networkmanager dhcpcd pulseaudio bluez blueman bluez-utils github-cli
		systemctl enable dhcpcd.service
		systemctl enable NetworkManager.service
		systemctl enable bluetooth.service
		systemctl start bluetooth 
		systemctl --user enable pulseaudio
		systemctl --user start pulseaudio

	;;

	2) # Desktop installation
		sudo pacman -S xorg xorg-xinit xterm plasma plasma-desktop plasma-wayland-session kde-applications kde-plasma-addons sddm 
		sudo systemctl enable sddm.service
	;;
	
	3) # Grub installation
		pacman -S grub efibootmgr dosfstools mtools
       		echo -n "do you want install os-prober for dual boot windows? [y/n] "
		read -r os_prober

		if [ -z "$os_prober" ]; then
			echo "Invalid input or empty choice. Exiting."
			exit 1
		fi

		if [ "$os_prober" == "y" ]; then
	       		pacman -S os-prober
		fi

		{
			install -Dm644 "$dotfiles/etc/default/grub" "/etc/default/grub"
		} || {
			echo "Error Moving files"
		}


		grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
		grub-mkconfig -o /boot/grub/grub.cfg	
	;;

	4) # Utilities packages installation
		echo "Updating"
		sudo pacman -Syyu --noconfirm
		echo "installing dependencies"
		# install essential utilities
		sudo pacman -S pipewire rsync ntfs-3g nvidia firefox unrar tar htop exfat-utils fuse-exfat zoxide wl-clipboard lazygit kitty kiten curl libreoffice-fresh gimp kdenlive audacity 
		sudo pacman -S ufw
		sudo ufw enable
		sudo systemctl enable ufw.service 	
	;;
	
	5) # Repo installation
		echo "Installer from repository github"
		echo -e "1. KDE Rounded Corner \n2. auto-cpufreq \n3. yay"
		echo -n "Choose the installation option: "
		read -r repository

		if [ -z "$repository" ]; then
			echo "Invalid input or empty choice. Exiting."
			exit 1
		fi

		case $repository in
			1) #KDE Rounded Corner installation
				git clone https://github.com/matinlotfali/KDE-Rounded-Corners ~/Public/KDE-RoundedCorners
				cd ~/Public/KDE-Rounded-Corners
				mkdir build
				cd build
				cmake .. --install-prefix /usr
				make
				sudo make install

				echo -n "Do you want to logout and log back in to activate the changes? [y/n]"
				read -r log_out

				if [ -z "$log_out" ]; then
					echo "Invalid input or empty choice. Exiting."
					exit 1
				fi

				if [ "$log_out" == "y" ]; then 
					kwin --replace &
				elif [ "$log_out" == "n" ]; then
					echo "okey maybe later but just type in cli 'kwin --replace &'"
				fi
			;;

			2) # auto-cpufreq installation
				git clone https://github.com/AdnanHodzic/auto-cpufreq.git ~/Public/auto-cpufreq
				cd ~/Public/auto-cpufreq
				sudo ./auto-cpufreq-installer
				sudo auto-cpufreq --install
			;;
			
			3) # yay installation
				git clone https://aur.archlinux.org/yay.git ~/Public/yay 
				cd ~/Public/yay
				makepkg -si
				yay --version
			;;
		esac
	
esac
