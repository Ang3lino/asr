#!/bin/sh

max_size=$1

./8.sh | while read user bsize nfiles; do
    if [ $bsize -gt $max_size ]; then
        printf "$user $bsize $nfiles\n" >> /var/log/user-storage.log
    fi
done

