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
    exit 1
fi