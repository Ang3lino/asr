#!/bin/sh

echo "$0 [FILES]..."
echo

if [[ $# -lt 1 ]] ; then
    exit 1
fi

DIR=$1

# ls -d ./folder1/*/
for file in $* ; do
    FILENAME=$(basename $file)
done



