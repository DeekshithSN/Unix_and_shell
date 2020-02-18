#!/bin/sh
folder_path="/home/deekshithsn1/application_logs"
cd $folder_path
count_of_files=$( ls -1 | wc -l )
if [ $count_of_files -gt 10 ]
then
echo "folder has more than 10 files"
ls -1t | tail -n +11 | xargs rm -f
else 
echo "folder has less than or equal to 10 files"
fi
