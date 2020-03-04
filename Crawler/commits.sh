#!/bin/bash
# Script written by Felipe Fronchetti
# Given a path to a git repository, this script is able to collect the date of all commits

if ! [ $# -eq 1 ]
  then
    echo "[Script] Few arguments. Be sure to enter the relative or absolute path of the repository folder."
    exit
fi

echo "[Script] Collecting repository contributions..."

folder=$1
cd $folder

echo "date,hash" > ../commits.csv
git log --date=short --pretty="format:%cd, %H" --no-notes --branches | sort -rn >> ../commits.csv
