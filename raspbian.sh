#!/bin/bash

##Open Sources:
# Web-UI by designmodo Flat-UI free project at https://github.com/designmodo/Flat-UI
# Monero github https://github.com/moneroexamples/monero-compilation/blob/master/README.md
# Monero Blockchain Explorer https://github.com/moneroexamples/onion-monero-blockchain-explorer
# PiNode-XMR scripts and custom files at my repo https://github.com/shermand100/pinode-xmr

###Begin

##User pinodexmr creation
echo -e "\e[32mStep 1: produce user 'pinodexmr'\e[0m" 
sleep 2
sudo adduser pinodexmr --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo -e "\e[32mUser 'pinodexmr' created\e[0m"
sleep 2

##Change system hostname to PiNodeXMR
#echo -e "\e[32mChaning system hostname to 'PiNodeXMR'\e[0m"
#sleep 2
#echo 'PiNodeXMR' | sudo tee /etc/hostname

##Replace file /etc/sudoers to set global sudo permissions/rules
echo -e "\e[32mDownlaod and replace /etc/sudoers file\e[0m"
sleep 2
wget https://raw.githubusercontent.com/shermand100/pinode-xmr/development/etc/sudoers
sudo chmod 0440 /home/pi/sudoers
sudo chown root /home/pi/sudoers
sudo mv /home/pi/sudoers /etc/sudoers
echo -e "\e[32mGlobal permissions changed\e[0m"
sleep 3

##Download user 'pinodexmr' script and put in home directory to continue
wget https://raw.githubusercontent.com/shermand100/pinode-xmr/development/raspbian-pinodexmr.sh
sudo mv /home/pi/raspbian-pinodexmr.sh /home/pinodexmr/
sudo chown pinodexmr /home/pinodexmr/raspbian-pinodexmr.sh
sudo chmod 755 /home/pinodexmr/raspbian-pinodexmr.sh

##make script run when user logs in
echo '. /home/pinodexmr/raspbian-pinodexmr.sh' | sudo tee -a /home/pinodexmr/.profile

##Change from user 'pi' to 'pinodexmr' and lock 'pi'
echo -e "\e[32mSwitching user to 'pinodexmr'\e[0m"
sleep 3
su - pinodexmr
#sudo -H -u pinodexmr bash -c 'bash /home/pinodexmr/raspbian-pinodexmr.sh' 

#End of script as user 'pi'. Continues in directory /home/pinodexmr