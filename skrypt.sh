#!/bin/bash

Argument=$1
if [ -z "$Argument" ]
then
  echo "Nie podano argumentu. Użyj: ./skrypt.sh <argument>"
  exit 0
fi

if [ "$Argument" == "--date" ] || [ "$Argument" == "-d" ]
then
    echo "Data i czas: $(date)"
elif [ "$Argument" == "--logs" ] || [ "$Argument" == "-l" ]
then
    if [ -z "$2" ]
    then
        Range=100
    else
        Range=$2
    fi

    for i in $(seq 1 $Range)
    do
        echo "Log $i, skrypt.sh, data: $(date)" >> "log$i.txt"
    done
elif [ "$Argument" == "--init" ] || [ "$Argument" == "-i" ]
then
    git clone "$(git config --get remote.origin.url)"
    #export PATH="$PWD:$PATH"
elif [ "$Argument" == "--error" ] || [ "$Argument" == "-e" ]
then
    mkdir -p errors
    cd errors
    if [ -z "$2" ]
    then
        Range=100
    else
        Range=$2
    fi

    for i in $(seq 1 $Range)
    do
        echo "Error$i" >> "Error$i.txt"
    done
elif [ "$Argument" == "--help" ] || [ "$Argument" == "-h" ]
then
    echo "Użycie: ./skrypt.sh <argument>"
    echo "Argumenty:"
    echo "Arguementy dostępne w skróconym formacie: -d, -l, -i, -e, -h"
    echo "--date - wyświetla aktualną datę i czas"
    echo "--logs {liczba} - generuje pliki logów 100 lub podaną liczbę"
    echo "--init  - klonuje repozytorium"
    echo "--error {liczba} - generuje pliki błędów 100 lub podaną liczbę"
    echo "--help  - wyświetla pomoc"
else
    echo "Nieznany argument. Użyj skrypt.sh --help, aby uzyskać więcej informacji."
fi