# penkitscript
Forked from (https://github.com/AlexisAhmed/BugBountyToolkit)  
All thanks to alexisahmed, however his version is quite outdated. This is a more roughed up version that is supposed to with with ubuntu 22.04 ( will probably work on other versions that are not far off. )

Very rough script to install pentesting tools. PRs would very much be appreciated.
If you have a tool that you would like to see installed in this script put up a pull request. This script has next to no customization apart from the seclists.
Customizations and custom parameters will be considered in the future.

Has to be run as a user with sudo permissions. with the command below to run as root with the home directory being the user ( unless you want it in /root )

sudo HOME=~ ./install.sh

Compromises:  
**1.** FeroxBuster is kind of broken. Working on it, will get it working by next week due to unrelated time-taking life tasks ( hopefully ).  
**2.** No customization ( will heavily brush this up and allow customization within june).  
**3.** As I get more experience with hands-on hacking. More resources will be available in this script as to make it the only script you need for setting up a quick hacking vps.  
**4.** Broken security. PIP installs everything as root, and so this is unsafe practice and be aware of this.  
  
Be ready for a complete overhaul sometime in the following 2-3 weeks.
