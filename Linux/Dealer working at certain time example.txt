#This script was designed to allow a user to look through a cassino's staff schedule and get the name of the employee working at a specific time.
#This script was replicated to include specific times, as specified in our task. 

!/bin/bash
ls | cat 0315_Dealer_schedule | grep 05:00 | grep AM |
awk -F" " '{print $1, $2, $5, $6}'
