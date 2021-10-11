#!/bin/bash

# Webhook URL
webhookURL=PASTE WEBHOOK URL HERE

# This is default nginx log path.
#You can replace the path according to your setup
logFile=/var/log/nginx/access.log

tail -fn0 $logFile | \
while read line ; do
        echo "$line" | grep "Googlebot"
        if [ $? = 0 ]
        then
	  curl  --silent --output /dev/null \
            -X POST \
	    "$webhookURL" \
            -d 'GoogleBot=Yes'
	fi
done
