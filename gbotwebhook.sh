#!/bin/bash

# Author: MC.Naveen
# Shell Script to Fire a webhook when GoogleBot visits your website.
# Github: https://github.com/mcnaveen/GoogleBot-Webhook-Trigger
# Note: If you're not using Nginx as your Webserver. Please change the logFile path accordingly

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
