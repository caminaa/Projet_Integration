#!/bin/bash

clear
clesortie=1
close=0
noir='\e[0;30m'
gris='\e[1;30m'
rougefonce='\e[0;31m'
rose='\e[1;31m'
vertfonce='\e[0;32m'
vertclair='\e[1;32m'
orange='\e[0;33m'
jaune='\e[1;33m'
bleufonce='\e[0;34m'
bleuclair='\e[1;34m'
violetfonce='\e[0;35m'
violetclair='\e[1;35m'
cyanfonce='\e[0;36m'
cyanclair='\e[1;36m'
grisclair='\e[0;37m'
blanc='\e[1;37m'

neutre='\e[0;m'

while [ "$close" -ne "$clesortie" ]
do

clear
echo -e "${rose} _______      ____       .-'''-. .---.  .---.    .-'''-. ,---------.    ____    .-------.     "
echo -e "\  ____  \  .'  __ \`.   / _     \|   |  |_ _|   / _     \\          \ .'  __ \`. |  _ _   \    "
echo -e "| |    \ | /   '  \  \ (\`' )/\`--'|   |  ( ' )  (\`' )/\`--' \`--.  ,---'/   '  \  \| ( ' )  |    "
echo -e "| |____/ / |___|  /  |(_ o _).   |   '-(_{;}_)(_ o _).       |   \   |___|  /  ||(_ o _) /    "
echo -e "|   _ _ '.    _.-\`   | (_,_). '. |      (_,_)  (_,_). '.     :_ _:      _.-\`   || (_,_).' __  "
echo -e "|  ( ' )  \.'   _    |.---.  \  :| _ _--.   | .---.  \  :    (_I_)   .'   _    ||  |\ \  |  | "
echo -e "| (_{;}_) ||  _( )_  |\    \`-'  ||( ' ) |   | \    \`-'  |   (_(=)_)  |  _( )_  ||  | \ \`'   / "
echo -e "|  (_,_)  /\ (_ o _) / \       / (_{;}_)|   |  \       /     (_I_)   \ (_ o _) /|  |  \    /  "
echo -e "/_______.'  '.(_,_).'   \`-...-'  '(_,_) '---'   \`-...-'      '---'    '.(_,_).' ''-'   \`'-'   ${neutre}"


echo " "
echo " "
echo "Veuillez rentrer la commande et/ou son paramètre : (tappez \"help\" pour recevoir de l'aide)" 
echo " "
echo " "

read commande parametre

if [ "$commande" = "ping" ]
then
	clear
	echo -e "${orange}  .-------. .-./\`) ,---.   .--.  .-_'''-.    "
	echo -e "  \  _(\`)_ \\\\\ .-.')|    \  |  | '_( )_   \   "
	echo -e "  | (_ o._)|/ \`-' \|  ,  \ |  ||(_ o _)|  '  "
	echo -e "  |  (_,_) / \`-'\`\"\`|  |\_ \|  |. (_,_)/___|"
	echo -e "  |   '-.-'  .---. |  _( )_\  ||  |  .-----. "
	echo -e "  |   |      |   | | (_ o _)  |'  \  '-   .' "
	echo -e "  |   |      |   | |  (_,_)\  | \  \`-'\`   |  "
	echo -e "  /   )      |   | |  |    |  |  \        /  "
	echo -e "  \`---'      '---' '--'    '--'   \`'-...-' ${neutre}"
	if [ -z $parametre ]
	then
		echo -e "Vous n'avez pas rentré de paramètre !"
		read
	fi 
	if [ $parametre ]
	then
		test=`ping -c 10 -i 0.2 $parametre 2>/dev/null`
		#echo $test
		if [[ $test = '' ]]
		then
			echo -e "${rouge} L'addresse IP n'est pas valide !${neutre}"
			read
		else
		
			echo -e "${jaune}Vous venez de ping ${neutre}${cyanclair}$parametre${neutre} ${jaune}, vous êtes vraiment doué(e), voici la moyenne en ms :${neutre} ${rose}"
			ping -c 10 -i 0.2 $parametre -q -w 1 | tail -n 1 | cut -d' ' -f4 | cut -d'/' -f2
			read
		fi
	fi      
	echo -e "${neutre}"
fi

if [ "$commande" = "help" ]
then
	clear
	echo -e "${vertclair}  .---.  .---.     .-''-.    .---.     .-------.  "
	echo -e "  |   |  |_ _|   .'_ _   \   | ,_|     \  _(\`)_ \ "
	echo -e "  |   |  ( ' )  / ( \` )   ',-./  )     | (_ o._)| "
	echo -e "  |   '-(_{;}_). (_ o _)  |\  '_ '\`)   |  (_,_) / "
	echo -e "  |      (_,_) |  (_,_)___| > (_)  )   |   '-.-'  "
	echo -e "  | _ _--.   | '  \   .---.(  .  .-'   |   |      "
	echo -e "  |( ' ) |   |  \  \`-'    / \`-'\`-'|___ |   |      "
	echo -e "  (_{;}_)|   |   \       /   |        \/   )      "
	echo -e "  '(_,_) '---'    \`'-..-'    \`--------\`\`---'${neutre}"
	echo " "
	echo -e "Voici la liste des commandes possibles :"
	echo -e "Close : Permet fermer l'application !"
	echo -e "ping [ip de la cible] : Permet de tester votre l'accés et la latence vers cet hôte"
	read
fi

if [ "$commande" = "close" ]
then
	close=1
fi
done
echo -e "${neutre}"
exit 0
