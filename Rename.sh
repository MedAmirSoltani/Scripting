#!/bin/bash
. function.sh #appel fichier function
if [ $# = 0 ];then #usage si il n ya pas d'argument
show_usage
fi
while getopts "ht:T:Nn:s:rgved:m" option #to read arguments
do
script $option
done
exit 0





