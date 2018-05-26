#!/bin/bash
chmod +x judge.sh

bold=$(tput bold)
normal=$(tput sgr0)

cyan='\033[0;36m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
yellow='\033[0;33m'
purple='\033[0;35m'
plain='\033[0m'

if [ -e Result ]; then 
	:
else 
	mkdir Result
fi

echo -e "${cyan}${bold}Welcome to Coo Judging ${normal}" |pv -qL20
foo=0
while [ $foo -lt 1 ]; do

	printf "\n" 
	if [ -e tmp ] ; then 
		:
	else
		 mkdir tmp
	fi
	for f in Submit/*.cpp ; do
		filename=$(basename -- $f)
		name="${filename%.*}"
		cname="${purple}"$name
		cname=$cname"${plain}"
		echo -e "\t${bold}Problem ${normal}: $cname"

		log="result_$name.log"
		if [ -e $log ] ; then
			> $log
		else
			touch $log
		fi

		if g++ -std=c++11 -O2 $f -o "tmp/$name" &> $log ; then
			:
		else
			echo -e "\t \e[38;5;199m${bold}Compile Error !!!${normal}${plain}"
			echo -e "\t \e[38;5;202m${bold}Skip ${normal}Problem $cname"
			printf "\n"
			continue
		fi

		if [ -e  "Test/$name" ] ; then
			echo -e "\t ${green}${bold}OK!${normal}${plain} Start Judging $cname"
		
			./judge.sh "tmp/$name" "Test/$name"
			echo -e "\t ${cyan}${bold}Done${normal} Judging $cname"	
		else
			echo -e "\t ${red}${bold}Error!${plain}${normal} Missing Test for Problem $cname"
			echo -e "\t \e[38;5;202m${bold}Skip ${normal}Problem $cname"
		fi
		printf "\n"
	done
	rm -r tmp
	printf "${blue}${bold}Continue Judging ? [y/N] ${normal}" 
	read -r response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]] ;
	then
	    :
	else
	    break ;
	fi
done
mv *.log Result &> /dev/null
echo -e "${blue}${bold}Press Any Key to Exit"
read -rn1
