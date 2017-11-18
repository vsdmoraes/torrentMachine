echo "Starting setting up..."

sudo cp configs/rc.local /etc/ 
sudo cp configs/dhcpcd.conf /etc/
sudo cp configs/hostname /etc/
sudo cp configs/hosts /etc/
sudo cp configs/settings.json /var/lib/transmission-daemon/info/
sudo cp configs/smb.conf /etc/samba/
sudo cp configs/plexmediaserver.prev /etc/default/


sudo usermod -a -G debian-transmission vsdmoraes
sudo smbpasswd -a vsdmoraes
sudo service smbd restart
sudo service plexmediaserver restart


echo "Setting up: Done."
