#!/bin/bash
#patikrint ar blokuojami hostai visdar veikia
sed -n 's/[\|\||#|\|]\([^/]*\)[\/|^|#].*/\1/p' ../easylistlithuania.txt | sed '/#.*/d' | sed '/[\||^~]/d' |sort -u > ~temp_hosts.txt
while read line; 
	do 
		stat=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' $line)
		if [ $stat -ne "200" -a $stat -ne "301" -a $stat -ne "302" -a $stat -ne "405" ]; then
			echo $line
		fi
	done < ~temp_hosts.txt
rm ~temp_hosts.txt
