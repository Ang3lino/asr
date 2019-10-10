#!/bin/sh

if [ $(id -u) -ne 0 ]; then
    echo 'please run as sudo'
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "$(echo $0 | sed 's/.\///g') [groupName] [user]..."
    exit 1
fi

# declare arguments
group_name=$1
shift
users=$*

# create the directory
mkdir $group_name
chmod -R 161 $group_name

groupadd $group_name  # create the group

for usr in $users; do
    useradd $usr -p $usr  # create the user
    adduser $usr $group_name  # append the user to the group
done

chgrp -R $group_name $group_name  # assign the directory recursively for a particular group

exit 0  # explicit status code
