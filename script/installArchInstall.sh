#!/bin/bash
echo "Need installation for sudo!!"
echo "this is installation package for arch installation"
echo "Before instalation update keyring"
pacman -Sy archlinux-keyring && pacman -Syyu
echo "Install arch package to root partition"
echo -e "1. system \n2. desktop\n3. grub \n4. packages \n5. yay"
echo -n "What do you want installing (numb / exit): "
read install

while [ $install != exit ]; do 
	if  [[ "$install" == "1" ]]; then
		pacstrap -i /mnt base base-devel linux linux-lts linux-headers linux-firmware intel-ucode sudo nano vim git neofetch networkmanager dhcpcd pulseaudio bluez blueman bluez-utils
		systemctl enable dhcpcd.service
		systemctl enable NetworkManager.service
		systemctl enable bluetooth.service
		systemctl start bluetooth 
		systemctl --user enable pulseaudio
		systemctl --user start pulseaudio

	fi

	if  [[ "$install" == "2" ]]; then 
		sudo pacman -S xorg xorg-xinit xterm plasma plasma-desktop plasma-wayland-session kde-applications kde-plasma-addons sddm 
		sudo systemctl enable sddm.service
	fi

	if  [[ "$install" == "3" ]]; then
		pacman -S grub efibootmgr dosfstools mtools
       		echo -n "do you want install os-prober for dual boot windows?[y/n] "
		read os_prober

		if [[ "$os_prober" == "y" ]]; then
	       		pacman -S os-prober
			cp ../etc/default/grub /etc/default
		fi
		grub-install --target=x86_64-efi --bootloader-id=grub_uefi --reacheck
		grub-mkconfig -o /boot/grub/grub.cfg	
	fi

	if  [[ "$install" == "4" ]]; then
		sudo pacman -S pipewire rsync ntfs-3g nvidia firefox brave-bin nvim
	fi

	if [[ "$install" == "5" ]]; then
		git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si
		yay --version
	fi

	echo -e "1. system \n2. desktop\n3. grub \n4. packages \n5. yay"
    	echo -n "What do you want installing (numb / exit): "
    	read install
done
