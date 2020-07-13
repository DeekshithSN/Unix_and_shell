i=0;
for p in "$@" ; do
    i=$((i+1))
        if [ "$p" = "c" ]; then 
        echo "User supllied C has a parameter, in $i position"
        fi
done
