#!/bin/sh

# log level
LOG_LEVEL=${LOG_LEVEL:-"error"}

# run salt as a deamon
exec /usr/bin/salt-master --log-level=$LOG_LEVEL
