#!/bin/sh

# log level
LOG_LEVEL=${LOG_LEVEL:-"error"}

while [ 1 ]
do
	sleep 100
done
# run salt as a deamon
#exec /usr/bin/salt-master --log-level=$LOG_LEVEL
