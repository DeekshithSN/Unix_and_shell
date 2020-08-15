read input
entered value is $input 
if [ -d $input ] ; then
rm -rf $input
else
echo "its file"
fi
