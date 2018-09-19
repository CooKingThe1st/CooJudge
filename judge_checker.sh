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
ceker="$testFile/checker" #for fun
touch ".checkerOutput.splog"
cekOut=".checkerOutput.splog"
# ".checkerOutput.splog"

numtest=0
point=0
iopoint=0
nmpoint=0
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

touch ".NMlog.splog"
touch ".RElog.splog"
touch ".TLElog.splog"
touch ".IOlog.splog"

touch ".REinfo.splog"
touch ".IOinfo.splog"
# 

for xtest in $testFile/*/;
do
	foo=$(($numtest % 10))
	if [ $foo -lt 1 ] ; then
		printf "\n \t"
	fi
	testname=$(basename $xtest)
	let numtest++
	flag_notfoundI=0
	flag_notfoundO=0
	inp=""

	if [ -e "$xtest/$orgname.inp" ]; then 
		inp="$xtest/$orgname.inp";
	elif [ -e "$xtest/$orgname.INP" ]; then 
		inp="$xtest/$orgname.INP";
	elif [ -e "$xtest/$orgname.in" ]; then 
		inp="$xtest/$orgname.in";
	elif [ -e "$xtest/$orgname.IN" ]; then 
		inp="$xtest/$orgname.IN";
	else
		flag_notfoundI=1
	fi

	flag_confused=0
	if [ -e "$xtest/$orgname.out" ]; then 
		flag_confused=1
	elif [ -e "$xtest/$orgname.OUT" ]; then 
		flag_confused=1
	fi

	if [ $flag_confused -eq 1 ]; then
		printf "\e[38;5;255m${bold} ¿ ${plain}${normal}"
		echo " $testname " >> ".IOlog.splog"
		printf " $testname contains output file " >> ".IOinfo.splog"
		let iopoint++
		continue
	fi
	temporaryOutputFile="$xtest$orgname.out"

	if [ $flag_notfoundI -eq 1 ]; then
		printf "\e[38;5;255m${bold} ? ${plain}${normal}"
		echo " $testname " >> ".IOlog.splog"
		printf " $testname lacks of " >> ".IOinfo.splog"
		if [ $flag_notfoundI -eq 1 ]; then
			printf "input " >> ".IOinfo.splog"
		fi
		printf " file \n" >> ".IOinfo.splog"
		let iopoint++
		continue
	fi

	if timeout --preserve-status --foreground $tlmit $exeFile < $inp > "$temporaryOutputFile"; 2> /dev/null; then
		:
	else 
		xcode=$?
		if [ $xcode == 143 ] ; then
			printf "\e[38;5;130m${bold} † ${plain}${normal}"
			echo " $testname " >> ".TLElog.splog"
			let tlepoint++
		else
			printf "\e[38;5;202m${bold} ø ${plain}${normal}"
			echo " $testname " >> ".RElog.splog"
			printf " $testname\n " >> ".REinfo.splog"
			printf " exit code $xcode \n" >> ".REinfo.splog"
			let repoint++
		fi
		continue
	fi

	cd $xtest
	if timeout --preserve-status --foreground $tlmit "../checker" > "../../../$cekOut" 2> /dev/null; then
		:
	else 
		xcode=$?
		cd -
		if [ $xcode == 143 ] ; then
			printf "\e[38;5;130m${bold} † ${plain}${normal}"
			echo " $testname " >> ".TLElog.splog"
			let tlepoint++
		else
			printf "\e[38;5;202m${bold} ø ${plain}${normal}"
			echo " $testname " >> ".RElog.splog"
			printf " $testname\n " >> ".REinfo.splog"
			printf " exit code $xcode \n" >> ".REinfo.splog"
			let repoint++
		fi
		rm "$temporaryOutputFile"
		continue
	fi
	cd - &> /dev/null
	rm "$temporaryOutputFile"
	partialScore="$(head -n 1 "$cekOut")"
	point=`echo $point + $partialScore | bc`

	printf "${yellow}${bold} ⦿ ${plain}${normal}"

	let nmpoint++
	echo " $testname " >> ".NMlog.splog"
	sed -i '1d' "$cekOut"
	cat "$cekOut" >> ".NMlog.splog"
	printf " \n " >> ".NMlog.splog"
done
if [ -e "$orgname.out" ]; then 
	rm "$orgname.out"
fi
printf "\n"
if [ $iopoint -eq $numtest ]; then
	echo -e "\t ${yellow}\e[7mDid you forget the input/answer files ?\e[27m"
fi
printf "\t ${bold}$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps$ms$ps${plain}\n"
echo "$point score which : " >> $log

echo "$iopoint test lacks I/O " >> $log
cat ".IOlog.splog" >> "$log"
echo "$repoint test RE " >> $log
cat ".RElog.splog" >> $log
echo "$tlepoint test TLE " >> $log
cat ".TLElog.splog" >> $log
echo "$nmpoint test run normal with" >> $log
cat ".NMlog.splog" >> $log

if [ $repoint -gt 0 ] ; then
	echo -e "\n" >> $log
	echo "RE info" >> $log
	cat ".REinfo.splog" >> $log
fi
if [ $iopoint -gt 0 ] ; then
	echo -e "\n" >> $log
	echo "I/O info" >> $log
	cat ".IOinfo.splog" >> $log
fi

echo $point > ".numAC.splog"
echo $numtest > ".numAll.splog"

