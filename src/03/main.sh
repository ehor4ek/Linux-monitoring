#!/bin/bash

source ./calculate.sh
calculate

if [ $# -ne 4 ]; then
    echo -e "You should set 4 parameters of script with numbers (1 — white, 2 — red, 3 — green, 4 — blue, 5 – purple, 6 — black):
1) Background of names
2) Colour of names
3) Background of values
4) Colour of values
"
else if [[ $1 -eq $2 || $3 -eq $4 ]]; then
    if [ $1 -eq $2 ]; then
        echo "Background and color of names must be different"
    fi
    if [ $3 -eq $4 ]; then
        echo "Background and color of values must be different"
    fi
else
    case $1 in
        1)
            name_bgc="\e[37;" ;;
        2)
            name_bgc="\e[31;" ;;
        3)
	        name_bgc="\e[32;" ;;
	    4)
	        name_bgc="\e[34;" ;;
	    5)
	        name_bgc="\e[35;" ;;
	    6)
	        name_bgc="\e[30;" ;;
        *)
            name_bgc="\e[0;" ;;
    esac
    case $2 in
        1)
            name_bgc+="47m" ;;
        2)
            name_bgc+="41m" ;;
        3)
            name_bgc+="42m" ;;
        4)
            name_bgc+="44m" ;;
        5)
            name_bgc+="45m" ;;
        6)
            name_bgc+="40m" ;;
        *)
            name_bgc+="0m" ;;
    esac

    case $1 in
        1)
            value_bgc="\e[37;" ;;
        2)
            value_bgc="\e[31;" ;;
        3)
	        value_bgc="\e[32;" ;;
	    4)
	        value_bgc="\e[34;" ;;
	    5)
	        value_bgc="\e[35;" ;;
	    6)
	        value_bgc="\e[30;" ;;
        *)
            value_bgc="\e[0;" ;;
    esac
    case $2 in
        1)
            value_bgc+="47m" ;;
        2)
            value_bgc+="41m" ;;
        3)
            value_bgc+="42m" ;;
        4)
            value_bgc+="44m" ;;
        5)
            value_bgc+="45m" ;;
        6)
            value_bgc+="40m" ;;
        *)
            value_bgc+="0m" ;;
    esac
    echo -e "$(echo $name_bgc)HOSTNAME\e[0m = $(echo $value_bgc)$HOSTNAME\e[0m
$(echo $name_bgc)TIMEZONE\e[0m = $(echo $value_bgc)$TIMEZONE\e[0m
$(echo $name_bgc)USER\e[0m = $(echo $value_bgc)$USER\e[0m
$(echo $name_bgc)OS\e[0m = $(echo $value_bgc)$OS\e[0m
$(echo $name_bgc)DATE\e[0m = $(echo $value_bgc)$DATE\e[0m
$(echo $name_bgc)UPTIME\e[0m = $(echo $value_bgc)$UPTIME\e[0m
$(echo $name_bgc)UPTIME_SEC\e[0m = $(echo $value_bgc)$UPTIME_SEC\e[0m
$(echo $name_bgc)IP\e[0m = $(echo $value_bgc)$IP\e[0m
$(echo $name_bgc)MASK\e[0m = $(echo $value_bgc)$MASK\e[0m
$(echo $name_bgc)GATEWAY\e[0m = $(echo $value_bgc)$GATEWAY\e[0m
$(echo $name_bgc)RAM_TOTAL\e[0m = $(echo $value_bgc)$RAM_TOTAL\e[0m
$(echo $name_bgc)RAM_USED\e[0m = $(echo $value_bgc)$RAM_USED\e[0m
$(echo $name_bgc)RAM_FREE\e[0m = $(echo $value_bgc)$RAM_FREE\e[0m
$(echo $name_bgc)SPACE_ROOT\e[0m = $(echo $value_bgc)$SPACE_ROOT\e[0m
$(echo $name_bgc)SPACE_ROOT_USED\e[0m = $(echo $value_bgc)$SPACE_ROOT_USED\e[0m
$(echo $name_bgc)SPACE_ROOT_FREE\e[0m = $(echo $value_bgc)$SPACE_ROOT_FREE\e[0m"
fi
fi