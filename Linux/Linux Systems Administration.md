## Linux Systems Administration activity 

For this task, we were asked to complete a number of steps to prepare a new server for a company. This file details the commands that I ran in order to do this.

### Step 1: Ensure Permissions on Sensitive Files
First, I set the permissions on the /etc/shadow file to allow only 'root' read and write access. To achieve this, I ran the following command:
- sudo chmod 600 /etc/shadow

Next, I used the same command to set the permissions on /etc/gshadow to allow only `root` read and write access:
- sudo chmod 600 /etc/gshadow

I then set the permissions on `/etc/group` to only allow `root` read and write access, and allow
everyone else read access only, using:
- sudo chmod 644 /etc/group

Permissions on `/etc/passwd` were then set to allow `root` read and write access, and allow
everyone else read access only:
- sudo chmod 644 /etc/passwd

### Step 2: Create User Accounts

Next, I was asked to add user accounts for `sam`, `joe`, `amy`, `sara`, and `admin`.

I used the below command to add each user account:
- sudo adduser sam
- sudo adduser joe
- sudo adduser amy
- sudo adduser sara
- sudo adduser admin

I then had to force users to create 16-character passwords incorporating numbers and symbols. I used this command to edit `pwquality.conf` file:
- sudo nano /etc/security/pwquality.conf

Updates to configuration file:
- Change minlen to 16
- Change minclass to 4

I used the 'chage' command to to set each new user's password to expire in 90 days:
- sudo chage -M 90 sam
- sudo chage -M 90 joe
- sudo chage -M 90 amy
- sudo chage -M 90 sara
- sudo chage -M 90 admin

Lastly, I ensure that only the `admin` has general sudo access, by adding `admin` to the `sudo` group:
- sudo usermod –aG sudo admin

### Step 3: Create User Group and Collaborative Folder

Next, I added an `engineers` group to the system:
- sudo addgroup engineers

I then added users `sam`, `joe`, `amy`, and `sara` to the managed group:
- sudo usermod –aG engineers sam
- sudo usermod –aG engineers joe
- sudo usermod –aG engineers amy
- sudo usermod –aG engineers sara

I then created a shared folder for this group at `/home/engineers`:
- sudo mkdir /home/engineers

I changed ownership on the new engineers' shared folder to the `engineers` group:
- sudo chgrp –R 775 /home/engineers

I added the SGID bit and the sticky bit to allow collaboration between engineers in this
directory:
SGID:
- sudo chmod 2000 /home/engineers
Sticky bit:
- sudo chmod 1000 /home/engineers

### Lynis and chkrootkit auditing 

Lastly, I installed the auditing tool Lynis and the application chkrootkit onto the system in order to harden it. 

To download Lynis I used:
- sudo apt install lynis 

To run an audit I used:
- sudo lynis audit system 

This returned a lengthy report, including 55 suggestions to harden the system. 

A sample of this is included in the image below:

![alt text](https://github.com/AnnabelleMacg/RedTeamProject/blob/main/Linux/Images/Lynis.png "Lynis sample")

To download chkrootkit I ran:
- sudo apt install chkrooitkit 

I then used the below command to generate a report:
- sudo chkrootkit -x

A sample of this report is included below:

![alt text](https://github.com/AnnabelleMacg/RedTeamProject/blob/main/Linux/Images/chkrootkit.png "Chkrootkit sample")





