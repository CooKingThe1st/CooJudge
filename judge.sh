#!/bin/bash

bell=$(tput bel)

bold=$(tput bold)
normal=$(tput sgr0)

dark='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[1;36m'
white='\033[1;37m'
plain='\033[0m'

exeFile=$1
testFile=$2

orgname=$(basename $testFile)
log="result_$orgname.log"

numtest=0
point=0
wapoint=0
repoint=0
tlepoint=0

ps="${red}+"
ms="${blue}-"
if [ $3 -eq 0 ]; then
	printf "\t ${red}${bold}set time limit${normal} "
	read tlmit
else
	tlmit=1
fi
printf "\t ${bold}$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps${plain}\t "
# printf "\t ${bold}${purple}αβγδεζηθικλμνξοπρςτυφχψω${plain}\n\t"

touch AClog.splog
touch WAlog.splog
touch RElog.splog
touch TLElog.splog
# 
for xtest in $testFile/*/;
do
	foo=$(($numtest % 10))
	if [ $foo -lt 1 ] ; then
		printf "\n \t"
	fi
	testname=$(basename $xtest)
	let numtest++
	inp="$xtest/$orgname.inp"
	out="$xtest/$orgname.out"
	if [ -e tmp.out ] ; then
		> tmp.out
	fi
	if timeout --foreground $tlmit $exeFile < $inp > tmp.out ; then
		:
	else 
		if [ $? == 124 ] ; then
			printf "${white}${bold} † ${plain}${normal}"
			echo " $testname " >> TLElog.splog
			let tlepoint++
		else
			printf "\e[38;5;209m${bold} ø ${plain}${normal}"
			echo " $testname " >> RElog.splog
			let repoint++
		fi
		continue
	fi
	
	if diff -Z $out tmp.out &> /dev/null; then
		printf "${green}${bold} ✔ ${plain}${normal}"
		let point++
		echo " $testname " >> AClog.splog
	else
		printf "${red}${bold} ✖ ${plain}${normal}"
		let wapoint++
		echo " $testname " >> WAlog.splog
	fi
done
if [ -e tmp.out ]; then 
	rm tmp.out 
fi
printf "\n \t ${green}${bold}$point AC ${normal}/ ${white}$numtest test ${normal}\n"
if [ $point = $numtest ] ; then
	echo -e "\t ${blue}\e[7m~~~~~~~~~~Accepted~~~~~~~~~~ \e[27m"
fi
printf "\t ${bold}$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps${plain}\n"
echo "$point / $numtest which : " >> $log
echo "$repoint test RE " >> $log
cat RElog.splog >> $log
echo "$tlepoint test TLE " >> $log
cat TLElog.splog >> $log
echo "$wapoint test WA " >> $log
cat WAlog.splog >> $log
echo "$point test AC " >> $log
cat AClog.splog >> $log
rm *.splog

echo $point > "xfoo.splog"
echo $numtest > "xbar.splog"

