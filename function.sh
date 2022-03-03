#!/bash/shell

script()
{
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
esac

}
Menu()
{
select item in "-t" "-T" "-n" "-N" "-d" "-s" "-h" "-v" "-g" "-e"
do
echo "Choose your option $REPLY:item"
echo -ne "
\e[31;5m        M E N U\e[0m"
case $REPLY in
1) 
echo -ne "
\e[4;3mRennomer Miniscule\e[0m"
2)
echo -ne "
\e[4;3mRennomer Majiscule\e[0m"
3)
echo -ne "
\e[4;3mEnlever extension\e[0m"
4)
echo -ne "
\e[4;3mEnlever espaces\e[0m"
5)
echo -ne "
\e[4;3mRAjouter _d\e[0m"
6)
echo -ne "
\e[4;3mAjouter extension\e[0m"
7)
echo -ne "
\e[4;3mAfficher help\e[0m"
8)
echo -ne "
\e[4;3mAfficher Auteurs\e[0m"
9)
echo -ne "
\e[4;3mAfficher Menu Graphique\e[0m"
10)
echo -ne "
\e[4;3mExit\e[0m
('Choose an option:') "
esac
done
}

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
