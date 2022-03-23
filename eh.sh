#!/bin/bash
main(){
echo "input first octet" 
read f
echo "input second octet"
read g
echo "input third octet"
read h
if [ $f -le 225 ]
then echo "."
else echo "octet 1 bad" && 
main
fi
if [ $f -ge 192 ]
then echo ".."
else echo "octet 1 bad" && 
main
fi 
if [ $g -le 255 ]
then echo "..."
else echo "octet 2 bad" && 
main
fi
if [ $g -ge 0 ]
then echo "...."
else echo "octet 2 bad" && 
main
fi 
if [ $h -le 255 ]
then echo "....."
else echo "octet 3 bad" && 
main
fi
if [ $h -ge 0 ]
then echo "......"
else echo "octet 3 bad" && 
main
fi 
for i in {1..254} do;
{
(ping -c 3 -l 3 -W 0.2 $f.$g.$h.$i) &>/dev/null && echo "$f.$g.$h.$i is up"
}
}
main
