echo "#####################"
echo "## Torrent Machine ##"
echo "####### v1.0 ########"

echo "
Created by vsdmoraes
"

echo "Updating dependencies..."
sudo apt-get update && sudo apt-get upgrade -y >> install.log
echo ""
echo "Installing..."

echo "  SSH"
sudo apt-get install ssh -y >> install.log

echo "  Transmission"
sudo apt-get install transmission-cli transmission-common transmission-daemon -y >> install.log

echo "  Plex"
sudo apt-get install apt-transport-https -y >> install.log
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | sudo apt-key add - >> install.log
echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list >> install.log
sudo apt-get update >> install.log
sudo apt-get install -t jessie plexmediaserver -y >> install.log

echo " Samba"
sudo apt-get install samba -y >> install.log
mkdir ~/Downloads
sudo chmod 777 ~/Downloads/

echo "Install: Done"

echo "Setting up..."
sudo chmod 777 settings.sh
sudo sh settings.sh


rm install.log
echo "Done."
echo "Rebooting in 3...2...1..."
sudo reboot
