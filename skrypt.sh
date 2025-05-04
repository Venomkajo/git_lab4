#!/bin/bash

Argument=$1
if [ -z "$Argument" ]
then
  echo "Nie podano argumentu. Użyj: ./skrypt.sh <argument>"
  exit 0
fi

if [ "$Argument" == "--date" ]
then
    echo "Data i czas: $(date)"
    exit 0
elif [ "$Argument" == "logs" ]
then
    echo "Logs"
    if [ -z "$2" ]
    then
        Range=100
    else
        Range=$2
    fi

    for i in $(seq 1 $Range)
    do
        echo "Log $i, skrypt.sh, data: $(date)" >> "log{$i}.txt"
    done