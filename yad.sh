#!/bin/bash
. function.sh 

Menu_Yad()
{
     yad --list \
                 --title="M E N U" \
                 --center \
                 --button=Acepter:0  \
                 --button=Cancel:1 \
                 --text="Select a command :" \
                 --buttonlist \
                 --column="" \
                 --button="-t":2 \
                 --button="-T":3 \
                 --button="-n":4 \
                 --button="-N":5 \
                 --button="-d":6 \
                 --button="-s":7 \
                 --button="-v":8 \
                 --button="-h":9 
}

 insert_input_all () #arguments/parametres graphiquement
{
	a=$(yad --form --width 300  --entry --title="Dialog"\
              --button=Acepter:0  \
             --button=Cancel:1 \
              --text="Inserer votre commande :" \
               --buttonlist \
                 --column="" \
                 --text-info="Commande" 
                 )

  

}
 
Menu_Yad
ans=$? 
if [ $ans -eq 2 ];then #ans= argument
     insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} == '&' ] || [[ ${a:$i:1} == " " ]];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for x in "${F[@]}" #F c'est la case qu'on a choisi
		do
			
Rename_Min x
		done
	fi  
	F=""     
elif [ $ans -eq 3 ];then
 	insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} == '&' ] || [[ ${a:$i:1} == " " ]];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for x in "${F[@]}"
		do
Rename_Maj
		done 
fi
F=""
elif [ $ans -eq 4 ]
then
    insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} == '&' ] || [[ ${a:$i:1} == " " ]];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for x in "${F[@]}"
		do
Remove_Ex
		done 
fi
    F=""
elif [ $ans -eq 5 ]
then
    insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} == '&' ] || [[ ${a:$i:1} == " " ]];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
	
			Remove_Space
		 
fi
 F=""
elif [ $ans -eq 6 ]
then
    insert_input_all $a
    ans=$?
    if [ "$ans" = 0 ];then
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} == '&' ] || [[ ${a:$i:1} == " " ]];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""
			fi
		done	
		for r in "${F[@]}"
		do
			ADD_D
		done 
fi
F=""
      
elif [ $ans -eq 7 ]
then
	insert_input_all $a
    ans=$?
    N=${#a}
		for i in $(seq 0 $N)
			do
				if [ ! ${a:$i:1} = '&' ] || [[ ${a:$i:1} == " " ]];then
				char="${a:$i:1}"
				name_new+=$char
			else
				F+=("$name_new")
				name_new=""

			fi
		done	
		ADD_EX  $x $y
		F=""
 
elif [ $ans -eq 8 ]
then
    less About.txt
    
elif [ $ans -eq 9 ]
then
    less README.txt

else
    echo "No result!"
 
fi

 
