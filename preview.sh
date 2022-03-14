#!/bin/bash

printf "%b" "\e[1;36m"

option="$1"

if [ "$option" == "" ]; then
echo ' ________  ___       ___                        
|\   ____\|\  \     |\  \                       
\ \  \___|\ \  \    \ \  \                      
 \ \  \    \ \  \    \ \  \                     
  \ \  \____\ \  \____\ \  \                    
   \ \_______\ \_______\ \__\                   
    \|_______|\|_______|\|__|                   
                                                
                                                
                                                
 ________  ________  ________  _________        
|\   ____\|\   __  \|\   __  \|\___   ___\      
\ \  \___|\ \  \|\  \ \  \|\  \|___ \  \_|      
 \ \_____  \ \   ____\ \  \\\  \   \ \  \       
  \|____|\  \ \  \___|\ \  \\\  \   \ \  \      
    ____\_\  \ \__\    \ \_______\   \ \__\     
   |\_________\|__|     \|_______|    \|__|     
   \|_________|                                 
                                                
                                                
 ___       ___  ________  ___  ___  _________   
|\  \     |\  \|\   ____\|\  \|\  \|\___   ___\ 
\ \  \    \ \  \ \  \___|\ \  \\\  \|___ \  \_| 
 \ \  \    \ \  \ \  \  __\ \   __  \   \ \  \  
  \ \  \____\ \  \ \  \|\  \ \  \ \  \   \ \  \ 
   \ \_______\ \__\ \_______\ \__\ \__\   \ \__\
    \|_______|\|__|\|_______|\|__|\|__|    \|__|'

    exit 0
fi


parts=$(echo "$option" | sed 's/\]\ /\n/1')
count=$(echo "$parts" | wc -l)

if [ "$count" -eq "2" ]; then
    cmd=$(echo "$parts" | head -1)
    cmd=$(echo "$cmd" | sed 's/\[//1')
    argPath=$(echo "$parts" | tail -n1)

    echo $argPath

    if [ "$cmd" == "shell" ]; then
        echo "bash --login -c \"$argPath\""
    else
        echo "bash --login -c \"$cmd '$argPath'\""
    fi
    
else
    argPath="$option"
    echo $argPath
    echo "open \"$option\""
fi
echo '-------------------------------------------------------------------------------'

printf "%b" "\e[0m"

if [[ -d "$argPath" ]]; then
    ls -la "$argPath"
else
    cat "$argPath"
fi