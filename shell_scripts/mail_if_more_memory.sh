#!/usr/bin/env bash


FILESYSTEM=/home

capacity=`df -Pm $FILESYSTEM | awk 'FNR==2 {print$5}' | cut -d% -f1`


if [ $capacity -gt 90 ]
then
echo 'space is more than 90'
echo "your mail system is greater than 10" | mail -s "full capacity alert" "deekshithsn@gmail.com"
else
echo 'space available'
fi
