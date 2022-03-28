#!/bin/bash

SHELL='/bin/bash'

list=""

for var in "$@"
do
    parts=$(echo "$var" | sed 's/:/\n/1')
    count=$(echo "$parts" | wc -l)

    searchDir=$(echo "$parts" | tail -n1)


    searchParts=$(echo "$searchDir" | sed 's/?/\n/1')
    mods=$(echo "$searchParts" | tail -n1)
    searchDir=$(echo "$searchParts" | head -1)

    searchDir=$(echo "$searchDir" | sed s:~:$HOME:g)

    if [[ "$mods" == *"r"* ]]; then
        files=$(ls -dr -1 $searchDir)
    else
        files=$(ls -d -1 $searchDir)
    fi
    
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

preCmd=''
if [ -f "$HOME/.config/cli-spotlight/cli-spotlight-source.sh" ]; then
    preCmd='. "$HOME/.config/cli-spotlight/cli-spotlight-source.sh" && '
fi

parts=$(echo "$option" | sed 's/\]\ /\n/1')
count=$(echo "$parts" | wc -l)

if [ "$count" -eq "2" ]; then
    cmd=$(echo "$parts" | head -1)
    cmd=$(echo "$cmd" | sed 's/\[//1')
    argPath=$(echo "$parts" | tail -n1)

    if [ "$cmd" == "shell" ]; then
        echo "bash --login -c \"$preCmd$argPath\""
        bash --login -c "$preCmd$argPath"
    else
        echo "bash --login -c \"$preCmd$cmd '$argPath'\""
        bash --login -c "$preCmd$cmd '$argPath'"
    fi
    
else
    echo "open \"$preCmd$option\""
    open "$preCmd$option"
fi
