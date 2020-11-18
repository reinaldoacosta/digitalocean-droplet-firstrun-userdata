#update the system
DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y
DEBIAN_FRONTEND=noninteractive apt autoremove --purge -y

#install docker from the snap store
snap install docker

#add alias commands
echo "alias root='sudo -sE'" >> /root/.bashrc
echo "alias update='sudo apt update'" >> /root/.bashrc
echo "alias upgrade='sudo apt upgrade -y'" >> /root/.bashrc
echo "alias list='apt list --upgradable'" >> /root/.bashrc
echo "alias autoremove='sudo apt purge --autoremove -y'" >> /root/.bashrc
echo "alias ns='screen -S '" >> /root/.bashrc
echo "alias dr='screen -dr '" >> /root/.bashrc

#remove unwanted programs
apt purge whoopsie unattended-upgrades ubuntu-report popularity-contest apport apport-symptoms -y
#prevent ubuntu from installing them again
apt-mark hold ubuntu-report popularity-contest apport whoopsie apport-symptoms

#optional create default docker networks
#enabled by default to my needs
docker network create database
docker network create traefik
docker network create email
