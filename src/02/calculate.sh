#!/bin/bash

calculate() {
    HOSTNAME=$(hostname)
    TIMEZONE=$(timedatectl | grep zone | awk -F':' '{print $2}' | awk '{print $1 " UTC " substr($3, 1, 1) substr($3,3,1) }')
    USER=$(whoami)
    OS=$(sed 's/\\n//g ; s/\\l//g' /etc/issue)
    DATE=$(date "+%d %b %Y %H:%M:%S")
    UPTIME=$(uptime -p)
    UPTIME_SEC=$(awk '{print $1}' /proc/uptime)

    ip_line=$(ip a | grep "inet[^6]" | tail -n 1 | awk '{print $2}')

    IP=$(echo $ip_line | awk -F '/' '{print $1}')

    mask_number=$(echo $ip_line | awk -F '/' '{print $2}')
    mask=""
    i=0
    while [ $mask_number -gt 0 ]; do
    if [ $mask_number -ge 8 ]; then
        let mask_number=$mask_number-8
        if [ $i -eq 0 ]; then
        mask="255"
        else 
        mask+=".255"
        fi
        let i=$i+1
    else
        s=7
        num=0
        while [ $mask_number -gt 0 ]; do
        let num=$num+2**$s
        let s=$s-1
        let mask_number=$mask_number-1
        done
        if [ $i -eq 0 ]; then
        mask="$num"
        else
        mask+=".$num"
        fi
        let i=$i+1
    fi
    done
    while [ $i -lt 4 ]; do
    if [ $i -eq 0 ]; then
        mask="0"
    else
        mask+=".0"
    fi
    let i=$i+1
    done

    MASK=$mask
    GATEWAY=$(ip r | grep -i default | awk '{print $3}')
    RAM_TOTAL=$(num=$(free -m | awk 'NR==2{print $2}'); echo "scale=3 ; $num / 1024" | bc | awk '{printf "%.3f\n", $0}')
    RAM_USED=$(num=$(free -m | awk 'NR==2{print $3}'); echo "scale=3 ; $num / 1024" | bc | awk '{printf "%.3f\n", $0}')
    RAM_FREE=$(num=$(free -m | awk 'NR==2{print $4}'); echo "scale=3 ; $num / 1024" | bc | awk '{printf "%.3f\n", $0}')
    SPACE_ROOT=$(echo "scale=2 ; $(df -k | awk '{if ($6 == "/") print $2}') / 1024" | bc | awk '{printf "%.2f MB\n", $0}')
    SPACE_ROOT_USED=$(echo "scale=2 ; $(df -k | awk '{if ($6 == "/") print $3}') / 1024" | bc | awk '{printf "%.2f MB\n", $0}')
    SPACE_ROOT_FREE=$(echo "scale=2 ; $(df -k | awk '{if ($6 == "/") print $4}') / 1024" | bc | awk '{printf "%.2f MB\n", $0}')
}