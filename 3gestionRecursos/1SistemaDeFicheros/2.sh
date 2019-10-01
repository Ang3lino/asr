#!/bin/sh

# ls -l | while read LINE ; do
#     PERMISSION=$(echo $LINE | awk '{print $1}')
#     USER_WRITE=$(echo $PERMISSION | cut -c3 )
#     NAME=$(echo $LINE | awk '{print $8}')
# done

stat -c "%A %n" * | while read PERMISSION FILENAME ; do
    W=$(echo "$PERMISSION" | cut -c3)
    echo $W
    if [ $W != "-" ] ; then
        echo $FILENAME
    fi
done

