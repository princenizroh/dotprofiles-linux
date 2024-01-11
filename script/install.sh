#!/bin/bash
#
echo "Install Configuration? [y/n]"
read myConfig

if [ -z $1 ]; then
	echo "Please user './install.sh <desktop>' avalible desktops are Kwin"
else
	if [[ $1 == "kwin" ]];
	then
		if [[ "$myConfig" == "y" ]];
		then
			echo "Using my Kwin config"
			source ../desktop/installKwin.sh
		fi
	fi
fi
