TorrentMachine
==============


Introduction
------------

This project has as objective create a torrent and media center server, donwloading and hosting all medias in a local network.

Technologies
------------

+ Raspbian (Basic)
+ SSH
+ Transmission-daemon
+ Plex

Installation
------------

It's possible install all dependecies with "install.sh"

> sudo sh install.sh

(If you use this method, when finish, please go to section ...)

Or you can install step by step, as following explained


 
 ############
 # INCOMPLETE #

Active SSH Service:

1) edit /etc/rc.local file (sudo nano /etc/rc.local)
2) just above last command (exit 0) add a line to start ssh (/etc/init.d/ssh start)
3) save & exit

Reference: https://www.raspberrypi.org/forums/viewtopic.php?p=612959&sid=abb24f703382a4ac228063057d7ae29a#p612959

--

Set IP Static: 

sudo nano /etc/dhcpcd.conf

interface eth0
    static ip_address=192.168.1.10/24
    static routers=192.168.1.1
    static domain_name_servers=192.168.1.1 8.8.8.8

interface wlan0
    static ip_address=192.168.1.10/24
    static routers=192.168.1.1
    static domain_name_servers=192.168.1.1 8.8.8.8

interface = This defines which network interface you are setting the configuration for.
static ip_address = This is the IP address that you want to set your device to. (Make sure you leave the /24 at the end)
static routers = This is the IP address of your gateway (probably the IP address or your router)
static domain_name_servers = This is the IP address of your DNS (probably the IP address of your router). You can add multiple IP addresses here separated with a single space.

Reference: http://www.modmypi.com/blog/how-to-give-your-raspberry-pi-a-static-ip-address-update

--

Set hostname and host:

sudo nano /etc/hostname

sudo nano /etc/hosts


Reference: https://www.howtoforge.com/linux-basics-set-a-static-ip-on-ubuntu

--

Install transmission-daemon:

sudo apt-get install transmission-cli transmission-common transmission-daemon

mkdir Downloads
chmod 777 Downloads

Reference: https://help.ubuntu.com/community/TransmissionHowTo

--

Install plex

sudo apt-get install apt-transport-https

wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | sudo apt-key add -
echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list
sudo apt-get update
sudo apt-get install -t jessie plexmediaserver



Reference: https://thepi.io/how-to-set-up-a-raspberry-pi-plex-server/
