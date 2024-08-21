#!/bin/bash

FILE=""
SFTP=""
DEST=""

# Set these variables for your own system for uploading to a remote host
SFTP_ADDR=""
SFTP_PORT=""
SFTP_USER=""
SFTP_FLDR=""

while getopts "f:s:d" option; do
	case $option in
		f) 	FILE=$OPTARG;;
		s) 	SFTP=1;;
		d)	DEST=$OPTARG;;
		\?)	echo "Usage: compile -f [filename] [-s]";;
	esac
done

COMPILER=sourcemod/scripting/spcomp

if [ ! -d "sourcemod/scripting" ] || [ ! -d "sourcemod/plugins" ]; then
    	echo "Sourcemod plugin folders not found"
    	exit 1
fi

echo "${FILE}.sp compile `date`" > compile.log
${COMPILER} sourcemod/scripting/${FILE}.sp --show-stats -h DEBUG= --use-stderr >> compile.log

if [ -f ${FILE}.smx ]; then
    	if [ -f sourcemod/plugins/${FILE}.smx ]; then
        	mv --backup=numbered sourcemod/plugins/${FILE}.smx sourcemod/plugins/disabled/
    	fi
    
    	if [ "$SFTP" ]; then
		sftp -P ${SFTP_PORT} ${SFTP_USER}@${SFTP_ADDR}:${SFTP_FLDR} <<EOF
			put ${FILE}.smx
			quit
EOF
    	fi

	if [ "$DEST" ]; then
    		mv ${FILE}.smx ${DEST}
	else
    		mv ${FILE}.smx ./sourcemod/plugins/
	fi
else
    	echo "${COMPILER} failed"
fi
