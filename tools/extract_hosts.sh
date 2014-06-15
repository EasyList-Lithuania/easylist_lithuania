#!/bin/bash
#istraukt visus adresus ir pažiūrėt ar visos reklamos visdar blokuojamos
sed -n 's/\(.*\..*\)\#.*/\1/p' ../easylistlithuania.txt |sed -n 's/\(.*\)\#.*/\1/gp' | sed 's/\#//'|sort -u > hosts.txt
sed -n 's/[\|\||#|\|]\([^/]*\)[\/|^|#].*/\1/p' ../easylistlithuania.txt | sed '/#.*/d' | sed '/[\||^~]/d' |sort -u > hosts.txt
x=11
lines=$(cat hosts.txt |wc -l)
while [ $x -le $lines ]
do
	end=$(($x+10))
	firefox $(sed -n "$x,${end}p" hosts.txt|xargs)
	let x=x+11
	read -p "[$x/$lines]Paspauskite enter norėdami atverti sekančius 10 URL."
done
