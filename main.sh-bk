
#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
#MONTH=`date |awk '{print $2}'`
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
        ls -la ./imageurls/ |awk '{print $9}' |sed '1,3d'
        echo "Enter the Month name which you wants to harvest date"
        read MONTH
	ls -la ./imageurls/"$MONTH"/ |awk '{print $9}' |sed '1,3d'
        echo "Enter the date that which you wants to Harvest data"
        read IDATE
        echo "How many servers you wish to run this Task ? (Ex.10)"
        read ISER
        echo "Enter the friendly name for Jobs (Ex-Anil)"
        read FNAME
        #Jobs & urls spliting
	find ./imageurls/"$MONTH"/"$IDATE"/urls/ -type f -not -name 'file' -print0 | xargs -0  -I {} rm -v {}  > /dev/null
	rm -rf ./imageurls/"$MONTH"/"$IDATE"/urls/tread
	split --number=l/$ISER ${fspec} --numeric-suffixes=1 --suffix-length=2  ./imageurls/"$MONTH"/"$IDATE"/urls/file  ./imageurls/"$MONTH"/"$IDATE"/urls/
        ls -la  ./imageurls/"$MONTH"/"$IDATE"/urls/ |awk '{print $9}' |grep -o '[0-9]\+'  > ./imageurls/"$MONTH"/"$IDATE"/urls/tread
	if [ -d "./imageurls/"$MONTH"/"$IDATE"/scripts" ]
	then
  		#echo "Directory already present"
		rm -rf ./imageurls/"$MONTH"/"$IDATE"/scripts/*
		for i in `cat ./imageurls/"$MONTH"/"$IDATE"/urls/tread`;do cp ./mainurls/mimages.sh ./imageurls/"$MONTH"/"$IDATE"/scripts/"$FNAME$i".sh;done 
		ls -la  ./imageurls/"$MONTH"/"$IDATE"/scripts/  |grep "$FNAME" |awk '{print $9}' >  ./imageurls/"$MONTH"/"$IDATE"/scripts/tread 
                spath=./imageurls/"$MONTH"/"$IDATE"/scripts
         	upath=./imageurls/"$MONTH"/"$IDATE"/urls
    		path="xaa"
               for i in `cat ./imageurls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,$path,$upath,g" "$spath"/"$i";done
               for i in `cat ./imageurls/"$MONTH"/"$IDATE"/urls/tread`;do find ./imageurls/"$MONTH"/"$IDATE"/scripts/"$FNAME""$i".sh |xargs sed -i "s,gaa,$i,g";done > /dev/null
	       for i in `cat ./imageurls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,job1,$i,g" "$spath"/"$i";done
	else
  		mkdir ./imageurls/"$MONTH"/"$IDATE"/scripts
		for i in `cat ./imageurls/"$MONTH"/"$IDATE"/urls/tread`;do cp ./mainurls/mimages.sh ./imageurls/"$MONTH"/"$IDATE"/scripts/"$FNAME$i".sh;done
                ls -la  ./imageurls/"$MONTH"/"$IDATE"/scripts/  |grep "$FNAME" |awk '{print $9}' >  ./imageurls/"$MONTH"/"$IDATE"/scripts/tread  
                spath=./imageurls/"$MONTH"/"$IDATE"/scripts
         	upath=./imageurls/"$MONTH"/"$IDATE"/urls
		path="xaa"
                for i in `cat ./imageurls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,$path,$upath,g" "$spath"/"$i";done
                for i in `cat ./imageurls/"$MONTH"/"$IDATE"/urls/tread`;do find ./imageurls/"$MONTH"/"$IDATE"/scripts/"$FNAME""$i".sh |xargs sed -i "s,gaa,$i,g";done > /dev/null
		for i in `cat ./imageurls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,job1,$i,g" "$spath"/"$i";done
	fi
	#screen job setup
	HOME=`pwd`;
	spath=./imageurls/"$MONTH"/"$IDATE"/scripts
	for i in `cat ./imageurls/"$MONTH"/"$IDATE"/scripts/tread`;do screen -S "$i" -d -m;done
	for i in `cat ./imageurls/"$MONTH"/"$IDATE"/scripts/tread`; do screen -r "$i" -X stuff $"cd $HOME; bash $spath/$i $IDATE | tee ./logs/images/$MONTH/$IDATE/$i.log \n" ;done
	echo "Images Jobs has been started, you can monitor it using following screens"
      	screen -ls
	echo "If you wish to check the running job status need to enter in screen using following command"
        echo "======================="
	echo "screen -r screen-name"
	echo "======================="
	echo "If job has already finihed you can exit from screen using following command"
	echo "======================"
	echo "exit"
	echo "======================"
	echo "If job is continues running then need to run following command"
	echo "======================"
	echo "CTL+A+D"
	echo "======================"
	pause
}
 
# do something in two()
two(){
	echo "two() called"
        pause
}
#web scrappng
three(){
        echo "three() called"
        pause
} 

# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " DHP DATA HARVESTING PROJECT  M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. IMAGE DATA HARVESTING"
	echo "2. VIDEO DATA HARVESTING"
	echo "3. WEB DATA HARVESTING"

	echo "4. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 4] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		4) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done

imageurls
