#!/bin/bash

clesortie=1
close=0

echo " _____   _____   __   _       _   _____   _   _   _____   
|  _  \ /  _  \ |  \ | |     | | /  _  \ | | | | |  _  \  
| |_| | | | | | |   \| |     | | | | | | | | | | | |_| |  
|  _  { | | | | | |\   |  _  | | | | | | | | | | |  _  /  
| |_| | | |_| | | | \  | | |_| | | |_| | | |_| | | | \ \  
|_____/ \_____/ |_|  \_| \_____/ \_____/ \_____/ |_|  \_\ "

while [ "$close" -ne "$clesortie" ]
do

read commande parametre

if [ "$commande" = "ping" ]
then
        ping -c 10 -i 0.2 $parametre -q | tail -n 1 | cut -d' ' -f4 | cut -d'/' -f2
fi
if [ "$commande" = "close" ]
then
	close=1
fi
done

exit 0
