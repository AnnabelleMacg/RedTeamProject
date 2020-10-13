## A High Stakes Investigation - Terminal and Bash activity 

The files in this repository were used to conduct an investigation on 'Lucky Duck Casino' - after it lost a significant amount of money on its roulette tables.

This activity was completed as part of my university studies.

### Downloading the data 

Using the wget command, I downloaded files that were provided to us by Lucky Duck Casino, including;
- Dealer schedules
- Win/loss player data from the roulette tables during the week where losses occured 

Samples of this data are outlined in the images below:

Dealer schedule:

![alt text](https://github.com/AnnabelleMacg/RedTeamProject/blob/main/Linux/Images/Dealer%20Analysis.png "Dealer schedule")

Win/loss player data:

![alt text](https://github.com/AnnabelleMacg/RedTeamProject/blob/main/Linux/Images/Player%20Analysis.png "Win/Loss player data")

### Gathering and correlating the evidence 

Next, I used grep to isolate the losses that occured during that week to determine:
- The times the losses occured on each day 
- If there was a certain player at these times 
- The total count of times that this player was active when losses occured

I gathered this data and placed it into a new file, called 'Roulette_Losses' and recorded my notes in a separate file. 

Using my findings, I then developed a script to determine whether there was a specific dealer that was working at these times. 

The script was customised to work on the dealer schedules provided, as pictured above, and isolates:
- Time
- AM/PM
- The first name of the roulette dealer
- The last name of the roulette dealer 

As per the instructions provided to us, this script was used as the basis of many different scripts, that were specific the date and time when a loss occured. 

One of these scripts has been included in this repo for your review, titled: Dealer working at certain time example.sh

### Scripting for future analysis 

Lastly, I developed a shell script to be used to analyse future employee schedules and easily find the roulette dealer at a specific time. 

The script was designed to accept the following two arguments:
- One for the date (four digits)
- One for the time 

This script is called roulette_dealer_finder_by_time.sh - it is included in this repo. 

### So who did it?

Using the data collected by my scripts, I was able to determine:

![alt text](https://github.com/AnnabelleMacg/RedTeamProject/blob/main/Linux/Images/Summary%20of%20findings.png "Summary of findings")
