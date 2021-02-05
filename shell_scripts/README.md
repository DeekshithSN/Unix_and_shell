### To execute shell script in debug mode use -x in first line like below 

#!/bin/sh -x 

### to get ip addresses from logfile use the below command 

grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" logfile | sort | uniq -c | sort -nr
