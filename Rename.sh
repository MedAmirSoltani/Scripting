#!/bash/shell
. function.sh 

while getopts "ht:T:Nn:s:rgved:m" option
do
script $option
done
exit 0





