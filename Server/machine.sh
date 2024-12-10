sudo adduser usersteam
sudo echo "DEVICE=enp0s8" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sudo echo "NAME=lan" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sudo echo "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sudo echo "BOOTPROTO=static" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sudo echo "IPADDR=10.7.1.4" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sudo echo "NETMASK=255.255.255.0" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sudo echo "DNS1=1.1.1.1" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
sudo nmcli connection reload
sudo nmcli connection up lan
sudo firewall-cmd --add-masquerade --permanent
sudo firewall-cmd --permanent --remove-service dhcpv6-client
sudo firewall-cmd --permanent --remove-service cockpit
sudo firewall-cmd --permanent --add-port=22/tcp
sudo firewall-cmd --reload
su usersteam
sudo hostnamectl set-hostname ServerGmod
sudo passwd usersteam
 -> Comment on fait pour mettre un mdp en sh? (123)
sudo systemctl restart sshd
sudo dnf update 
sudo dnf install wget
su root
wget https://linuxgsm.com/dl/linuxgsm.sh 
chmod +x linuxgsm.sh
su usersteam
bash linuxgsm.sh gmodserver
./gmodserver install




