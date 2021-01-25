# mysql-load-checker
check mysql load, if load is more then 100 mysql will be reloaded 

# Sctipt 
```
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
```
# Console Log
```
22:09:50-07-10-2019-im-dead
23:42:11-07-10-2019-im-dead
20:09:52-07-24-2019-im-dead
18:01:09-01-27-2020-im-dead
```
<a href="https://www.buymeacoffee.com/smurfmanx" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
