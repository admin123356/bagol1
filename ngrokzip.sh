#! /bin/bash

# Make Instance Ready for Remote Desktop or RDP

b='\033[1m'
r='\E[31m'
g='\E[32m'
c='\E[36m'
endc='\E[0m'
enda='\033[0m'

clear

# Branding

printf """$c$b
# PAKAI LAH DENGAN BIJAK
printf "\n$g$b    PAKAI LAH DENGAN BIJAK $endc$enda" >&2
{
! wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip 
! unzip ngrok-stable-linux-amd64.zip
} &> /dev/null &&
printf "\r$c$b    PAKAI LAH DENGAN BIJAK $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }
