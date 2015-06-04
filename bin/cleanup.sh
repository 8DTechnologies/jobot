#!/bin/sh

# Clean up logs for jobot.  Keep both the last log and the symlink to it.


cd /data/cloud/jobot/log
for i in `/bin/ls`
  do
    if [ "`pwd -P`/$i" != "`readlink jobot.log`" ] && [ "$i" != "jobot.log" ]; then
      rm $i
    fi
  done
kill -9 $PPID
