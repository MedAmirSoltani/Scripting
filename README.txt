NAME
	
	Rename.sh rename file

SYNOPSIS
	
	./rename.sh [OPTION]... [ARGUMENT]...

DESCRIPTION

	This Script is used to rename files or folders with multiple options and choices by the user. 

OPTIONS

	-t 
		Renames files or directories put as parameter to downcase
	-T 
		Renames files or directories put as parameter to Upcase
	-n 
		Removes Extension from files put in parameter
	-N
		Removes Spaces from file/directory names 
	-d
		Adds _d to folders put in parameter
	-s 
		Adds extension to file put in parameter
	-g
		Shows Graphical Menu
	-m			
		Shows textual menu
	-v
		Shows author names and info
	-h 
		Shows the readmefile


Examples :
         use : ./Rename.sh -T folder_name
                or bash Rename.sh -s file_name extension_name

WARNING
	
	using this to renmae files from root can cause various problems to your system
