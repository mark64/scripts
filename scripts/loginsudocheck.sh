#!/bin/sh
if [ "$(ls /home/public/sudoqueue | grep sudoqueue | wc -l )" -ne "0" ]
	then
		printf "Items found in sudo queue\n\n"
		sudo sudoscript
	else
		exit 0 #printf "No items in sudo queue\n"
fi
