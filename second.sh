echo "This is from $0"
echo "Number of parameters is $#"
echo "The parameters are $*"
echo "The params are $@"
ls
if [ $? -eq 0 ];then 
echo "the last command is suscess"
fi
