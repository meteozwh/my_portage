#!/bin/bash

. /etc/chkrebootrc

if ssh ${EXTERNAL_HOST} ls /var/lock/restart_autossh_lock 2>/dev/null >/dev/null;
then
   echo "restart autossh..."
   systemctl restart autossh
   ssh ${EXTERNAL_HOST} rm /var/lock/restart_autossh_lock
fi
