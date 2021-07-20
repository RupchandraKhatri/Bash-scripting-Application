#!/bin/bash
toContinue(){
	echo ""
	echo -e "Do you want to continue this again? " 
	echo "-----------'Yes' or 'No'-------------"
	echo -e "Yes- To repeat.\nNo- To exit."
	echo ""
	read ans
	if [ -z $ans ]
	then
		echo "***************************************"
		echo "*-----------  Warning!!! -----------   *"
		echo "The input must be either 'Yes' or 'No'."
		echo "****************************************"
	elif [ $ans == No ]
	then
		exit 0
	elif [ $ans == Yes ]
	then
		countryCode
	else
		echo "Please enter 'Yes' to repeat and 'No' to exit."
	fi
}


choosePlayer(){
	if [ $1 == 3 ] 
	then
		echo ""
		echo "***--Choose your favourite Player.--***"
		PS3="Select the player: "
		select code in $P1 $P2 $P3 
		do
			case $code in
			"LM") cat messi
			     break
			  ;;
			 "NJ") cat neymar
			     break
			  ;;
			  "KC") cat kiran
			     break
			  ;;
			  "ZZ") 
				echo "***********************************"
				echo "*  Sorry! File not found.         *"
				echo "***********************************"
			     break
			  ;;
			  "HK") 
				echo "***********************************"
				echo "*  Sorry! File not found.         *"
				echo "***********************************"
			     break
			  ;;
			  *) echo "Enter valid input.!"
			  	choosePlayer 3
			  ;;
                     esac
                done
                toContinue
           else
                 echo ""
                 echo "Warning!! Please enter valid input"
                 PlayerCode
           fi
}

playerCode(){
	echo ""
	echo "**************************************"
	echo ""
	echo "---------------------------------"
	echo "| Player Code	| Player Name 	 |"
	echo " --------------------------------"
	echo "| LM  	    	| Lionel Messi   |"
	echo "| NJ	    	| Neymar Junior  |"
	echo "| KC 	    	| Kiran Chemjong |"
	echo "| ZZ	    	| Zheng Zhi      |"
	echo "| HK 	    	| Harry Kane     |"
	echo "----------------------------------"
	echo ""
	echo "Choose any three players.(Player code)"
	echo ""
	echo -e "Enter Players code:(separated by a space)"
	read P1 P2 P3
	player=($P1 $P2 $P3)
	noOfArg=${#player[@]}
	if [[ ${#player[@]} -eq 3 ]]
	then
		if [ $P1 == $P2 ] || [ $P2 == $P3 ] || [ $P1 == $P3 ]
		then
			echo -e "\n|------------------------------|"
			echo -e "|Do not enter same player code.|\n|Try different code.           |"
			echo -e "|------------------------------|"
			playerCode
		else
			for a in $player
        		do
        		if [[ $a == "LM" || $a == "NJ" || $a == "KC" || $a == "ZZ" || $a == "HK" ]]
        		then
				continue
			else
        			echo ""
        			echo "Please enter the valid code provided in the list."
        			playerCode
        		fi
        		done
        	fi
	     	choosePlayer 3
	else
      	echo ""
      	echo -e ""
      	echo -e "Enter the code of only 3 players.(seperated by a space)"
      	echo -e ""
      playerCode
      fi
}

countryDesc(){
	echo "***************************************"
	echo "---------------NEPAL-------------------"
	echo -e "-Nepal is the best football team.\n-It has recently won three Nations Cup.\n"
	playerCode
}

countryCode(){
	echo "********************************"
	echo ""
	echo "--------------------------------"
	echo "| Country Code	| Country Name |"
	echo " -------------------------------"
	echo "| BRZ  	    	| Brazil       |"
	echo "| ARG	    	| Argentina    |"
	echo "| NEP 	    	| Nepal        |"
	echo "| CHI	    	| China        |"
	echo "| ENG 	    	| England      |"
	echo "---------------------------------"
	echo ""

	country=""
	until [[ $country == NEP ]]
	do
		echo ""
		echo -e "Which is the best football team?"		
		echo ""
		echo -e "Enter the country code here--> \c"
		read country
		echo ""
		case $country in
		"BRZ") 
		echo "****************************************"
		echo -e "The code you have entered is wrong.\nPLease choose another Country code."
		echo "****************************************"
		;;
		"ARG") 
		echo "****************************************"		
		echo -e "The code you have entered is wrong.\nPLease choose another Country code."
		echo "****************************************"		
		;;
		"NEP") echo -e "Congrulations!!!.You have entered correct country code."
		;;
		"CHI") 
		echo "****************************************"
		echo -e "The code you have entered is wrong.\nPLease choose another Country code."
		echo "****************************************"		
		;;
		"ENG") 
		echo "****************************************"
		echo -e "The code you have entered is wrong.\nPLease choose another Country code."
		echo "****************************************"		
		;;
		*) 
		echo "********************************************"		
		echo "Sorry! Please enter the valid country code."
		echo "*********************************************"
		echo ""
		esac
	done
	echo ""
	countryDesc
}

user(){
	echo -e "ID Number: " $1
	echo -e "User Name: " $2		
	echo "Date:" $(date)
}


if [ $# -gt 2 ]
then
	echo -e "Sorry! only two parameter are acceptable.\n So,You must enter only two parameter to enter into the system."
elif [ $# == 2 ]
then
	num=1
	while [ $num -le 5 ]
	do
		echo -e "Enter your secret key:--> \c"
		read sk
		if [ $sk == 1 ]
		then
			echo "**********************"
			echo "--------FOOTBALL--------"
			echo "--------WELCOME----------"
			user $2 $1
			countryCode
			break
		else
			echo "You have entered incorrect password $num times."
			((num++))
			if (( $num == 5 ))
			then
				echo -e "\nThe program is being terminated....."
				sleep 3s
				exit 0
			fi
		fi
	done
else
	echo "Please enter two parameter to enter into the system."
fi


