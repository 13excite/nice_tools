#!/bin/bash
 
for f in $(ls /export/log/server.log.*); do
    logdate=${f##*.}
    logday=$(date --date="$logdate" +%j)
    curday=$(date +%j)
    if [ $((curday - logday)) -gt 3 ]; then
        echo "remove: $f"
        #rm -f "$f"
    else
        echo "leave: $f"
    fi
done
 
exit 0
