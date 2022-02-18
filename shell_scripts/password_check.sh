echo "please enter password"
read password
countchar=$( echo $password | wc -c)
if [ $countchar -gt 10 ];
then
   if [[ "$password" =~ ['!#$%^&*()_+']  && "$password" =~ [[:upper:]] && "$password" =~ [[:lower:]] &&  "$password" =~ [0-9]  ]]
   then 
   echo "password meets all the creteria"
   else
    echo "meets length creteria but pass should conatin 1 special characters "
   fi

else 
echo "your password length not matchning length requirment it should be 10 chars or more than that"
fi
