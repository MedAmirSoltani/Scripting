#!/bin/bash
script()
{
#choisir loption avec case
case $option in
h)
HELP
;;
t)
x=$OPTARG
Rename_Min
;;
T)
x=$OPTARG
Rename_Maj
;;
N)
Remove_Space
;;
n)
x=$OPTARG
Remove_Ex
;;
d)
r=$OPTARG
ADD_D
;;
s)
ADD_EX $2 $3
;;
v)
less About.txt
;;
m)
Menu
;;
g)
bash yad.sh
;;
*)
show_usage
;;
esac

}
Menu()
{ #animation et appel des fonctions
echo -ne "\e[31;5m        M E N U\e[0m 
"
select item in "Rennomer Miniscule" "Rennomer Majiscule" "Enlever extension" "Ajouter _d" "Ajouter extension" "Afficher help" "Afficher Auteurs" "Afficher Menu Graphique" "-g" "-e" 
do
echo "Your Option is :  $REPLY "
case $REPLY in
1) 
echo "D0nnez le nom du rep/fichier :"
read x
Rename_Min
;;
2)
echo "D0nnez le nom du rep/fichier :"
read x
Rename_Maj
;;
3)
echo "D0nnez le nom du rep/fichier :"
read x
Remove_Ex
;;
4)
echo "D0nnez le nom du rep/fichier :"
read r
ADD_D
;;
5)
echo "D0nnez le nom du rep/fichier :"
read x
echo "D0nnez l'extension  :"
read y
ADD_EX $x $y
;;
6)
HELP
;;
7)
less About.txt
;;
8)
echo "interface graphique"
;;
9)
bash yad.sh
;;
10)
exit 0
;;
*)
echo "option doesnt exist ^^"
;;
esac
done

}

show_usage() #guide
{
  echo " rename.sh: [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.."
};
HELP()
{
less README.txt #less to execute readme
}
Rename_Min() 
{
if [ ! -e "$x" ]; then
			echo -e "\e[1;31m Erreur en [$x]: \e[0m"
			echo "Reprtoire\Fichier non existant"
	elif [ -f "$x" ];then	
    y=`dirname "${x}"`/`basename "${x}" | tr '[A-Z]' '[a-z]'` #dirname= directory basename=esm lfichier
    if [ "${x}" != "${y}" ]
    then
        [ ! -e "${y}" ] && mv "$x" "$y" || echo -e "\e[1;33m $x was not renamed \e[0m"
    fi
    elif [ -d "$x" ];then	
    y=`dirname "${x}"`/`basename "${x}" | tr '[A-Z]' '[a-z]'`
    if [ "${x}" != "${y}" ]
    then
        [ ! -e "${y}" ] && mv "$x" "$y" || echo -e "\e[1;33m $x was not renamed \e[0m" 
    fi
	fi
}

Rename_Maj()
{
if [ ! -e "$x" ]; then
			echo -e "\e[1;31m Erreur en [$x]: \e[0m"
			echo "Reprtoire\Fichier non existant"
	elif [ -f "$x" ];then	
    y=`dirname "${x}"`/`basename "${x}" | tr '[a-z]' '[A-Z]'` #dirname= directory basename=esm lfichier
    if [ "${x}" != "${y}" ]
    then
        [ ! -e "${y}" ] && mv "$x" "$y" || echo -e "\e[1;33m $x was not renamed \e[0m"
    fi
    elif [ -d "$x" ];then	
    y=`dirname "${x}"`/`basename "${x}" | tr '[a-z]' '[A-Z]'`
    if [ "${x}" != "${y}" ]
    then
        [ ! -e "${y}" ] && mv "$x" "$y" || echo -e "\e[1;33m $x was not renamed \e[0m" 
    fi
	fi
}

Remove_Space()
{
for f in *\ *; do mv "$f" "${f// /_}"; done
}
Remove_Ex()
{
if [ ! -e $x ];then
	echo -e "\e[1;31m Erreur en [$x]: \e[0m"
			echo "Fichier non existant"
	elif [ -f $x ];then
	D=`dirname "${x}"`/`basename "${x}" | cut -f 1 -d '.'` #dirname= directory basename=esm lfichier
	if [ "${x}" != "${D}" ]
    then
        [ ! -e "${D}" ] && mv -T "${x}" "${D}" || echo -e "\e[1;33m $x was not renamed \e[0m"
   	fi
	elif [ -d $x ];then
	echo echo -e "\e[1;31m Insert a File not a folder \e[0m"
	fi

}
ADD_D()
{
if [ ! -e "$r" ]; then #-e si il existe
		echo -e "\e[1;31m Erreur en [$r]: \e[0m"
			echo "Reprtoire non existant"
	elif [ -f "$r" ];then	
    echo "Erreur en [$r]: Entrez un Repertoire valide"
    elif [ -d "$r" ];then	
    D=`dirname "${r}"`/`basename "${r}"`"_d"
    if [ "${r}" != "${D}" ]
    then
        [ ! -e "${D}" ] && mv "${r}" "${D}" || echo -e "\e[1;33m $r was not renamed \e[0m"
    fi
	fi
}
ADD_EX()
{
	if [ ! -e "$1" ]; then
			echo -e "\e[1;31m Erreur en [$1]: Fichier non existant \e[0m"
	elif [ -d "$1" ];then	
    echo "Erreur en [$1]: Entrez un Fichier valide"
    elif [ -f "$1" ];then	
    DST=`dirname "${1}"`/`basename "${1}"`".""$2" #dirname= directory basename=esm lfichier
    if [ "${2}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${1}" "${DST}" || echo -e "\e[1;33m $1 was not renamed \e[0m"
    fi
	fi
}
