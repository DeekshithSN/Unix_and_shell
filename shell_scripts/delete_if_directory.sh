read input
echo "entered value is $input"
if [ -d $input ] ; then
rm -rf $input
elif [  -f $input ] ; then 
echo "its file"
else
echo "file or directory not found"
fi
