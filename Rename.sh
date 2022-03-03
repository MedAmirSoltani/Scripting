#!/bash/shell

show_usage()
{
  echo " rename.sh: [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.."
};
HELP()
{
less README.txt
}
Rename_Min()
{
if [ ! -e "$x" ]; then
			echo -e "\e[1;31m Erreur en [$x]: \e[0m"
			echo "Reprtoire\Fichier non existant"
	elif [ -f "$x" ];then	
    y=`dirname "${x}"`/`basename "${x}" | tr '[A-Z]' '[a-z]'`
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
    y=`dirname "${x}"`/`basename "${x}" | tr '[a-z]' '[A-Z]'`
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
	D=`dirname "${x}"`/`basename "${x}" | cut -f 1 -d '.'`
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
if [ ! -e "$r" ]; then
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
    DST=`dirname "${1}"`/`basename "${1}"`".""$2"
    if [ "${2}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${1}" "${DST}" || echo -e "\e[1;33m $1 was not renamed \e[0m"
    fi
	fi
}
Menu()
{

echo -ne "
\e[31;5m        M E N U\e[0m
('-t') \e[4;3mRennomer Miniscule\e[0m
('-T') \e[4;3mRennomer Majiscule\e[0m
('-n)') \e[4;3mEnlever extension\e[0m
('-N)') \e[4;3mEnlever espaces\e[0m
('-d)') \e[4;3mRAjouter _d\e[0m
('-s)') \e[4;3mAjouter extension\e[0m
('-h |--help)') \e[4;3mAfficher help\e[0m
('-v)') \e[4;3mAfficher Auteurs\e[0m
('-g)') \e[4;3mAfficher Menu Graphique\e[0m
('-e)') \e[4;3mExit\e[0m
('Choose an option:') "

}

if [ "$#" = 0 ];then
	show_usage
fi

case $1 in

-h)
HELP
;;
-t)
echo "Give the Name of file/REP to rename to downcase : "
read x
Rename_Min
;;
-T)
echo "Give the Name of file/REP to rename to UPCASE : "
read x
Rename_Maj
;;
-N)
Remove_Space
;;
-n)
echo "Give the Name of file  to Remove extension : "
read x
Remove_Ex
;;
-d)
echo "Give the Name of Folder to ADD _d to itc  : "
read r
ADD_D
;;
-s)
ADD_EX $2 $3
;;
-v)
less About.txt
;;
-m)
Menu
esac
exit 0



