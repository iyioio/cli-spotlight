#!/bin/bash

SHELL='/bin/bash'

list=""

for var in "$@"
do
    parts=$(echo "$var" | sed 's/:/\n/1')
    count=$(echo "$parts" | wc -l)

    searchDir=$(echo "$parts" | tail -n1)

    searchDir=$(echo "$searchDir" | sed s:~:$HOME:g)

    files=$(ls -d -1 $searchDir)
    
    if [ "$count" -eq "2" ]; then
        cmd=$(echo "$parts" | head -1)
        files=$(echo "$files" | sed s/^/[$cmd]\ /g)
    fi
    
    list+=$'\n'$files
    
done


previewPath="$(dirname "$0")/preview.sh"


option=$(echo "$list" | fzf --reverse --preview "$previewPath {}")

if [ "$option" == "" ]; then
    exit 1
fi

parts=$(echo "$option" | sed 's/\]\ /\n/1')
count=$(echo "$parts" | wc -l)

if [ "$count" -eq "2" ]; then
    cmd=$(echo "$parts" | head -1)
    cmd=$(echo "$cmd" | sed 's/\[//1')
    argPath=$(echo "$parts" | tail -n1)

    if [ "$cmd" == "shell" ]; then
        echo "bash --login -c \"$argPath\""
        bash --login -c "$argPath"
    else
        echo "bash --login -c \"$cmd '$argPath'\""
        bash --login -c "$cmd '$argPath'"
    fi
    
else
    echo "open \"$option\""
    open "$option"
fi
