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
elif [ "$Argument" == "--logs" ]
then
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
elif [ "$Argument" == "--help" ]
then
    echo "Użycie: ./skrypt.sh <argument>"
    echo "Argumenty:"
    echo "--date  - wyświetla aktualną datę i czas"
    echo "--logs {liczba} - generuje pliki logów 100 lub podaną liczbę"
    echo "--help  - wyświetla pomoc"
else
    echo "Nieznany argument. Użyj skrypt.sh --help, aby uzyskać więcej informacji."
fi