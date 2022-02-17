#!/bin/bash
DIR_PATH=$(dirname $(realpath $0))

SEEN=$DIR_PATH/seen

COUNT=`cat /var/log/nginx/brng_access.log | grep -c -i bing`

# LOG=/tmp/checkBing.log

# env >> $LOG

# uncomment for testing
# COUNT=2

if [ -f $SEEN ]
then
	# don't keep sending emails when we first see it
	echo File seen 
	exit
fi

if [[ $COUNT =~ ^[1-9]+$ ]];
then
	echo Sending mail
	/usr/sbin/sendmail -t <<- EMAIL
	To: James McDonald <james@toggen.com.au>
	From: Toggen Web Server <jamesmcd73@gmail.com>
	Subject: We have seen a Bing Crawler for Brays Roofing
	
	DATE: `date`

	Entries: ${COUNT}
	EMAIL

	touch $SEEN
else
	echo Zero
fi
