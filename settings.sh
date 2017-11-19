echo "Starting setting up..."

sudo service transmission-daemon stop

sudo cp configs/rc.local /etc/ 
sudo cp configs/dhcpcd.conf /etc/
sudo cp configs/hostname /etc/
sudo cp configs/hosts /etc/
sudo cp configs/settings.json /var/lib/transmission-daemon/info/
sudo cp configs/settings.json /etc/transmission-daemon/
sudo cp configs/smb.conf /etc/samba/
sudo cp configs/plexmediaserver.prev /etc/default/

sudo service transmission-daemon start	

sudo usermod -a -G debian-transmission pi
sudo smbpasswd -a pi
sudo service smbd restart
sudo service plexmediaserver restart


echo "Setting up: Done."
