#!/bin/bash
echo This program was written by Dmitry Borobov from group 710-1
while [ 1 ]
do
	echo "Please, enter the packet name"
	read packetName;
	res=$(dnf list installed | grep "^$packetName" | wc -l) #esli est` to budet stroka simvolov, inache pustaya
	if [ "$res" != "0" ];
		then echo This packet installed
	else
		pos=$(dnf search "$packetName" | grep "^$packetName" | wc -l)
		if [ "$pos" != "0" ];
			then 
				state=true
				while [ "$state" = "true" ]
				do
					echo "This packet is not installed. But you can try to install it, are you? (Yes=1|No=0)"
					read answer
					if [ "$answer" = "1" ];
						then sudo dnf install "$packetName" -y
						state=false;
					elif [ "$answer" = "0" ];
						then state=false;
						echo Okay..
					else continue;
					fi
				done
		else
			echo "This packet is not exist :)"
		fi
	fi
	
	#Asking user code
	state=true
	while [ "$state" = "true" ]
	do
		echo "Do you want to search a next packet? (Yes=1|No=0)"
		read ans
		if [ "$ans" = "1" ];
			then echo Well, continue
			break
		elif [ "$ans" = "0" ];
			then
			echo Goodbye my friend 
			exit
		else 
			echo Uncorrect input, try again...
		fi
	done
done
