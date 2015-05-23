#!/bin/bash

Continue=1
Number=0
Script_in=( $INPUT )

Add() {
echo "do you wish to archive another file?"
echo ""
echo "[Y]es / [N]o"
echo ""
echo -n "> "
read opt
case $opt in
  [Yy]* )
	;;
	[Nn]* )
	Continue=0
	;;
esac
}

Loop() {
until [ $Continue = 0 ]; do
	Number=$((Number+1))
	echo ""
	echo "Please type the directory path of the file you wish to archive."
	echo ""
	echo -n "> "
	read INPUT
	Script_in[$Number]=$INPUT
	echo ""
	Add
done
}

clear
echo "Please enter the directory path you wish to archive to"
echo ""
echo -n "> "
read out
echo ""
Loop
for in in "${Script_in[@]}"
do
	rsync -avh $in $out
done
echo "Complete."
