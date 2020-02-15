#!/bin/bash

while true
do
	NOW=$(date +"%T-%m-%d-%Y")
	loadavg=`uptime | awk '{print $10+0}'`
	thisloadavg=`echo $loadavg|awk -F \. '{print $1}'`
		if [ "$thisloadavg" -gt "100" ]; then
 			echo "Busy - Load Average $loadavg ($thisloadavg) "
 			systemctl restart mariadb
 			echo "$NOW-im-dead" >> status.log
		else
 			echo "Okay - Load Average $loadavg ($thisloadavg) "
		fi
sleep 60
done
