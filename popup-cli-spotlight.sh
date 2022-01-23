#!/bin/bash


dirn=$(dirname $0)
dirn=$(realpath $dirn)



res=$(system_profiler SPDisplaysDataType | grep -Eio "resolution: *([0-9])+ *x *([0-9])+")

widths=$(echo "$res" | cut -d" " -f2)

max=0
index=0
i=0

for n in $widths
do
    if ((n > max)); then
        max="$n"
        index="$i"
    fi
    i=$((i+1))
done

res=$(echo "$res" | sed "${i}q;d")
width=$(echo "$res" | cut -d" " -f2)
height=$(echo "$res" | cut -d" " -f4)

cols=140
rows=35
fontWidth=14
fontHeight=22
winWidth=$((fontWidth*cols))
winHeight=$((fontHeight*rows))

TITLE="CLI-Spotlight"
X=$(((width-winWidth)/2))
Y=$(((height-winHeight)/2))

alacritty -t "${TITLE}" -o window.position.x="${X}" -o window.position.y="${Y}" -o window.dimensions.lines="$rows" -o window.dimensions.columns="$cols" -o window.decorations=none -e "$dirn/cli-spotlight.sh" "$@"