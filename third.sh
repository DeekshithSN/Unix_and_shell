sum=`expr $1 + $2`
sum_new=$(( $1 + $2 ))
echo "$sum,$sum_new"
ls 
if [ ! $? -eq 0 ]; then 
echo "true!!!"
fi

if [ $1 -gt $2 ]; then 
echo "first param is grater than second"
else
echo "second is grater"
fi 

if [ $1 -gt 10 -o $2 -gt 10 ]; then
echo "both are greater than 10"
fi
