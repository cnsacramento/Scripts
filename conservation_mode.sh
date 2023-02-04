#!/bin/bash


option=$1

case $option in
	off) # Disable conservation mode
		echo 0 | sudo tee $(find /sys/devices -iname "*conservation_mode*" 2>/dev/null)
		if [[ $? -eq 0 ]] 
		then
			echo "Conservation mode disable"
		fi
		;;
	on) # Enables conservation mode
		echo 1 | sudo tee $(find /sys/devices -iname "*conservation_mode*" 2>/dev/null)
		if [[ $? -eq 0 ]] 
		then
			echo "Conservation mode enabled"
		fi
		;;
	*)
		echo "There is not any option selected"
		;;
esac
