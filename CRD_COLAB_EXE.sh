! wget https://raw.githubusercontent.com/SwayamJoshi87/remocolab.xrdp/main/remocolab.py
! ./remocolab.py
! remocolab.setupVNC()

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
 
██████╗░░█████╗░░██████╗░░█████╗░██╗░░░░░  ██╗░░░██╗██████╗░░██████╗
██╔══██╗██╔══██╗██╔════╝░██╔══██╗██║░░░░░  ██║░░░██║██╔══██╗██╔════╝
██████╦╝███████║██║░░██╗░██║░░██║██║░░░░░  ╚██╗░██╔╝██████╔╝╚█████╗░
██╔══██╗██╔══██║██║░░╚██╗██║░░██║██║░░░░░  ░╚████╔╝░██╔═══╝░░╚═══██╗
██████╦╝██║░░██║╚██████╔╝╚█████╔╝███████╗  ░░╚██╔╝░░██║░░░░░██████╔╝
╚═════╝░╚═╝░░╚═╝░╚═════╝░░╚════╝░╚══════╝  ░░░╚═╝░░░╚═╝░░░░░╚═════╝░
██╗░░██╗░█████╗░░█████╗░██╗░░██╗██╗███╗░░██╗░██████╗░
██║░░██║██╔══██╗██╔══██╗██║░██╔╝██║████╗░██║██╔════╝░
███████║███████║██║░░╚═╝█████═╝░██║██╔██╗██║██║░░██╗░
██╔══██║██╔══██║██║░░██╗██╔═██╗░██║██║╚████║██║░░╚██╗
██║░░██║██║░░██║╚█████╔╝██║░╚██╗██║██║░╚███║╚██████╔╝
╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░╚═════╝░
    $r ALFIAN ADI SUKMA $c 
$endc$enda""";



# Used Two if else type statements, one is simple second is complex. So, don't get confused or fear by seeing complex if else statement '^^.

# Creation of user
printf "\n\nCreating user " >&2
if sudo useradd -m user &> /dev/null
then
  printf "\ruser created $endc$enda\n" >&2
else
  printf "\r$r$b Error Occured $endc$enda\n" >&2
  exit
fi

# Add user to sudo group
sudo adduser user sudo

# Set password of user to 'root'
echo 'user:root' | sudo chpasswd

# Change default shell from sh to bash
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

# Initialisation of Installer
printf "\n\n$c$b    Loading Installer $endc$enda" >&2
if sudo apt-get update &> /dev/null
then
    printf "\r$g$b    Installer Loaded $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
    exit
fi

# Installing Chrome Remote Desktop
printf "\n$g$b    Installing Chrome Remote Desktop $endc$enda" >&2
{
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    sudo dpkg --install chrome-remote-desktop_current_amd64.deb
    sudo apt install --assume-yes --fix-broken
} &> /dev/null &&
printf "\r$c$b    Chrome Remote Desktop Installed $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }



# Install Desktop Environment (XFCE4)
printf "$g$b    Installing Desktop Environment $endc$enda" >&2
{
    sudo DEBIAN_FRONTEND=noninteractive \
        apt install --assume-yes xfce4 desktop-base
    sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
    sudo apt install --assume-yes xscreensaver
    sudo systemctl disable lightdm.service
} &> /dev/null &&
printf "\r$c$b    Desktop Environment Installed $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }



# Install Google Chrome
printf "$g$b    Installing Google Chrome $endc$enda" >&2
{
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg --install google-chrome-stable_current_amd64.deb
    sudo apt install --assume-yes --fix-broken
} &> /dev/null &&
printf "\r$c$b    Google Chrome Installed $endc$enda\n" >&2 ||
printf "\r$r$b    Error Occured $endc$enda\n" >&2



# Install CrossOver (Run exe on linux)
printf "$g$b    Installing CrossOver $endc$enda" >&2
{
    wget https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_20.0.2-1.deb
    sudo dpkg -i crossover_20.0.2-1.deb
    sudo apt install --assume-yes --fix-broken
} &> /dev/null &&
printf "\r$c$b    CrossOver Installed $endc$enda\n" >&2 ||
printf "\r$r$b    Error Occured $endc$enda\n" >&2



# Install OBS-Studio (Livestream)
printf "$g$b    Installing Obs-studio $endc$enda" >&2
{
    sudo apt install ffmpeg -y
    sudo add-apt-repository ppa:obsproject/obs-studio -y
    sudo apt install obs-studio -y
    sudo apt install --assume-yes --fix-broken
} &> /dev/null &&
printf "\r$c$b    OBS-Studio Installed $endc$enda\n" >&2 ||
printf "\r$r$b    Error Occured $endc$enda\n" >&2

# Install VLC Media Player 
printf "$g$b    Installing VLC Media Player $endc$enda" >&2
{
    sudo apt install vlc -y
} &> /dev/null &&
printf "\r$c$b    VLC Media Player Installed $endc$enda\n" >&2 ||
printf "\r$r$b    Error Occured $endc$enda\n" >&2

# Install apt install xrdp
printf "$g$b    Install apt install xrdp $endc$enda" >&2
{
    sudo apt install xrdp -y
    sudo apt install xfce4 -y
    sudo apt install xfce4-goodies -y
} &> /dev/null &&
printf "\r$c$b    Install apt install xrdp $endc$enda\n" >&2 ||
printf "\r$r$b    Error Occured $endc$enda\n" >&2

# Install other tools like nano
sudo apt-get install gdebi -y &> /dev/null
sudo apt-get install vim -y &> /dev/null
printf "$g$b    Installing other Tools $endc$enda" >&2
if sudo apt install nautilus nano -y &> /dev/null
then
    printf "\r$c$b    Other Tools Installed $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
fi


# JANGAN LUPA subscriber LELED CHANNEL 
printf "$g$b JANGAN LUPA subscriber LELED CHANNEL $endc$enda" >&2
{
! service xrdp start -y
! ./ngrok
! ./ngrok tcp 3389
} &> /dev/null &&
printf "\r$c$b    JANGAN LUPA subscriber LELED CHANNEL $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }

printf "\n$g$b    Installation Completed $endc$enda\n\n" >&2; >&2; exit; }
