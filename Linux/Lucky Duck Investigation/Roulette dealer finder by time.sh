#This script was designed to allow a user to find which dealer was working at a cassino at a specific time.
#It was tailored to work for a specific table, that was provided.

#!/bin/bash
cat $1_Dealer_schedule | grep $2 | grep $3 |
awk -F" " '{print $1, $2, $5, $6}'


