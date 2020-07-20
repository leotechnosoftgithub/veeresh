
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
	ls -la ./videourls/ |awk '{print $9}' |sed '1,3d'
        echo "Enter the Month name which you wants to harvest date"
        read MONTH
        ls -la ./videourls/"$MONTH"/ |awk '{print $9}' |sed '1,3d'
        echo "Enter the date that which you wants to Harvest data"
        read IDATE
        echo "How many servers you wish to run this Task ? (Ex.10)"
        read ISER
        echo "Enter the friendly name for Jobs (Ex-Anil)"
        read FNAME
        #Jobs & urls spliting
        find ./videourls/"$MONTH"/"$IDATE"/urls/ -type f -not -name 'file' -print0 | xargs -0  -I {} rm -v {}  > /dev/null
        rm -rf ./videourls/"$MONTH"/"$IDATE"/urls/tread
        split --number=l/$ISER ${fspec} --numeric-suffixes=1 --suffix-length=2  ./videourls/"$MONTH"/"$IDATE"/urls/file  ./videourls/"$MONTH"/"$IDATE"/urls/
        ls -la  ./videourls/"$MONTH"/"$IDATE"/urls/ |awk '{print $9}' |grep -o '[0-9]\+'  > ./videourls/"$MONTH"/"$IDATE"/urls/tread
        if [ -d "./videourls/"$MONTH"/"$IDATE"/scripts" ]
        then
                #echo "Directory already present"
                rm -rf ./videourls/"$MONTH"/"$IDATE"/scripts/*
                for i in `cat ./videourls/"$MONTH"/"$IDATE"/urls/tread`;do cp ./mainurls/videos.sh ./videourls/"$MONTH"/"$IDATE"/scripts/"$FNAME$i".sh;done
                ls -la  ./videourls/"$MONTH"/"$IDATE"/scripts/  |grep "$FNAME" |awk '{print $9}' >  ./videourls/"$MONTH"/"$IDATE"/scripts/tread
                spath=./videourls/"$MONTH"/"$IDATE"/scripts
                upath=./videourls/"$MONTH"/"$IDATE"/urls
                path="xaa"
               for i in `cat ./videourls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,$path,$upath,g" "$spath"/"$i";done
               for i in `cat ./videourls/"$MONTH"/"$IDATE"/urls/tread`;do find ./videourls/"$MONTH"/"$IDATE"/scripts/"$FNAME""$i".sh |xargs sed -i "s,gaa,$i,g";done > /dev/null
               for i in `cat ./videourls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,job1,$i,g" "$spath"/"$i";done
        else
                mkdir ./videourls/"$MONTH"/"$IDATE"/scripts
                for i in `cat ./videourls/"$MONTH"/"$IDATE"/urls/tread`;do cp ./mainurls/videos.sh ./videourls/"$MONTH"/"$IDATE"/scripts/"$FNAME$i".sh;done
                ls -la  ./videourls/"$MONTH"/"$IDATE"/scripts/  |grep "$FNAME" |awk '{print $9}' >  ./videourls/"$MONTH"/"$IDATE"/scripts/tread
                spath=./videourls/"$MONTH"/"$IDATE"/scripts
                upath=./videourls/"$MONTH"/"$IDATE"/urls
                path="xaa"
                for i in `cat ./videourls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,$path,$upath,g" "$spath"/"$i";done
                for i in `cat ./videourls/"$MONTH"/"$IDATE"/urls/tread`;do find ./videourls/"$MONTH"/"$IDATE"/scripts/"$FNAME""$i".sh |xargs sed -i "s,gaa,$i,g";done > /dev/null
                for i in `cat ./videourls/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,job1,$i,g" "$spath"/"$i";done
        fi
        #screen job setup
        HOME=`pwd`;
        spath=./videourls/"$MONTH"/"$IDATE"/scripts
        for i in `cat ./videourls/"$MONTH"/"$IDATE"/scripts/tread`;do screen -S "$i" -d -m;done
        for i in `cat ./videourls/"$MONTH"/"$IDATE"/scripts/tread`; do screen -r "$i" -X stuff $"cd $HOME; bash $spath/$i $IDATE | tee ./logs/videos/$MONTH/$IDATE/$i.log \n" ;done
        echo "Videos Jobs has been started, you can monitor it using following screens"
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
#keywords scrappng
three(){
        ls -la ./keywords/ |awk '{print $9}' |sed '1,3d'
        echo "Enter the Month name which you wants to harvest date"
        read MONTH
        ls -la ./keywords/"$MONTH"/ |awk '{print $9}' |sed '1,3d'
        echo "Enter the date that which you wants to Harvest data"
        read IDATE
        echo "How many servers you wish to run this Task ? (Ex.10)"
        read ISER
        echo "Enter the friendly name for Jobs (Ex-Anil)"
        read FNAME
        #Jobs & urls spliting
        find ./keywords/"$MONTH"/"$IDATE"/urls/ -type f -not -name 'file' -print0 | xargs -0  -I {} rm -v {}  > /dev/null
        rm -rf ./keywords/"$MONTH"/"$IDATE"/urls/tread
        split --number=l/$ISER ${fspec} --numeric-suffixes=1 --suffix-length=2  ./keywords/"$MONTH"/"$IDATE"/urls/file  ./keywords/"$MONTH"/"$IDATE"/urls/
        ls -la  ./keywords/"$MONTH"/"$IDATE"/urls/ |awk '{print $9}' |grep -o '[0-9]\+'  > ./keywords/"$MONTH"/"$IDATE"/urls/tread
        if [ -d "./keywords/"$MONTH"/"$IDATE"/scripts" ]
        then
                #echo "Directory already present"
                rm -rf ./keywords/"$MONTH"/"$IDATE"/scripts/*
                for i in `cat ./keywords/"$MONTH"/"$IDATE"/urls/tread`;do cp ./mainurls/kimages.sh ./keywords/"$MONTH"/"$IDATE"/scripts/"$FNAME$i".sh;done
                ls -la  ./keywords/"$MONTH"/"$IDATE"/scripts/  |grep "$FNAME" |awk '{print $9}' >  ./keywords/"$MONTH"/"$IDATE"/scripts/tread
                spath=./keywords/"$MONTH"/"$IDATE"/scripts
                upath=./keywords/"$MONTH"/"$IDATE"/urls
                path="xaa"
               for i in `cat ./keywords/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,$path,$upath,g" "$spath"/"$i";done
               for i in `cat ./keywords/"$MONTH"/"$IDATE"/urls/tread`;do find ./keywords/"$MONTH"/"$IDATE"/scripts/"$FNAME""$i".sh |xargs sed -i "s,gaa,$i,g";done > /dev/null
               for i in `cat ./keywords/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,job1,$i,g" "$spath"/"$i";done
        else
                mkdir ./keywords/"$MONTH"/"$IDATE"/scripts
                for i in `cat ./keywords/"$MONTH"/"$IDATE"/urls/tread`;do cp ./mainurls/kimages.sh ./keywords/"$MONTH"/"$IDATE"/scripts/"$FNAME$i".sh;done
                ls -la  ./keywords/"$MONTH"/"$IDATE"/scripts/  |grep "$FNAME" |awk '{print $9}' >  ./keywords/"$MONTH"/"$IDATE"/scripts/tread
                spath=./keywords/"$MONTH"/"$IDATE"/scripts
                upath=./keywords/"$MONTH"/"$IDATE"/urls
                path="xaa"
                for i in `cat ./keywords/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,$path,$upath,g" "$spath"/"$i";done
                for i in `cat ./keywords/"$MONTH"/"$IDATE"/urls/tread`;do find ./keywords/"$MONTH"/"$IDATE"/scripts/"$FNAME""$i".sh |xargs sed -i "s,gaa,$i,g";done > /dev/null
                for i in `cat ./keywords/"$MONTH"/"$IDATE"/scripts/tread`;do sed -i "s,job1,$i,g" "$spath"/"$i";done
        fi
        #screen job setup
        HOME=`pwd`;
        spath=./keywords/"$MONTH"/"$IDATE"/scripts
        for i in `cat ./keywords/"$MONTH"/"$IDATE"/scripts/tread`;do screen -S "$i" -d -m;done
        for i in `cat ./keywords/"$MONTH"/"$IDATE"/scripts/tread`; do screen -r "$i" -X stuff $"cd $HOME; bash $spath/$i $IDATE | tee ./logs/keywords/$MONTH/$IDATE/$i.log \n" ;done
        echo "keywords Jobs has been started, you can monitor it using following screens"
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
#web scrapping
four(){
        echo "four() called"
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
	echo "3. Keywords data Harvesting"
	echo "4. WEB DATA HARVESTING"
	echo "5. Exit"
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
		4) four;;
		5) exit 0;;
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
