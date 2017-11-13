# TorrentMachine

## Introduction

This project has the objective to create a torrent and media center server, donwloading and hosting all medias in a local network.

## Technologies

+ [Raspbian Lite](https://www.raspberrypi.org/downloads/raspbian/) as operational system.
+ [Transmission-daemon](https://transmissionbt.com) as torrent web client.
+ [Plex](https://www.plex.tv) as media center server.
+ [Samba](https://www.samba.org) as network file system. *(Optional)*

## Before to install

> This step is optional, you can skip to the installation, but I highly recommend do the following settings. 


### Activating SSH on Startup

> Note: I'm using SSH in this project, because it's an easy way to work with Raspbian Lite, since this version doesn't exist GUI. So, if you don't want use it, feel free to skip this step.

You've to edit /etc/rc.local file 
```
$ sudo nano /etc/rc.local
```

And just above last command (exit 0) add a line to start ssh
 
```
/etc/init.d/ssh start
```

Now save & exit.

*(**Disclaimer**: I know that isn't the best way to do it, but it's the easiest.)*

(**Source**: [Raspberry Pi Forums](https://www.raspberrypi.org/forums/viewtopic.php?p=612959&sid=abb24f703382a4ac228063057d7ae29a#p612959))


---
### Setting a Static IP

Now let's set a Static IP, to be easier to access the servers. 

You've to edit the /etc/dhcpcd.conf file.

``` 
$ sudo nano /etc/dhcpcd.conf
```
And add the following parameters:
```
interface eth0
    static ip_address=192.168.1.10/24
    static routers=192.168.1.1
    static domain_name_servers=192.168.1.1 8.8.8.8

interface wlan0
    static ip_address=192.168.1.10/24
    static routers=192.168.1.1
    static domain_name_servers=192.168.1.1 8.8.8.8
```
Where:

**interface** - This defines which network interface you are setting the configuration for.

**static ip_address** - This is the IP address that you want to set your device to. (Make sure you leave the /24 at the end)

**static routers** - This is the IP address of your gateway (probably the IP address or your router)

**static domain_name_servers** - This is the IP address of your DNS (probably the IP address of your router). You can add multiple IP addresses here separated with a single space.

Now save and exit.

(**Source**: [Mod My Pi Blog](http://www.modmypi.com/blog/how-to-give-your-raspberry-pi-a-static-ip-address-update))


---
### Setting hostname and host

First, edit the /etc/hostname file

```
$ sudo nano /etc/hostname
```

Now delete the current and type yours hostname

Example:

```
vsdmoraes
```

Also, modify you hosts to create an "internal DNS". 

```
$ sudo nano /etc/hosts
```

and type your Static IP and the host link

Example:
```
192.168.1.10    vsdmoraes.com
```

(**Source**: [How to Forge](https://www.howtoforge.com/linux-basics-set-a-static-ip-on-ubuntu))


---

### You are almost there...

Now you are ready to start :)

Please, reboot you system and verify if you network and everything are ok.
```
$ sudo reboot
```
---
## Installation

It's possible to install all dependecies with "install.sh"

```
$ sudo sh install.sh
```

> Note: If you use this method, when finish, please go to [Settings](#settings)
 
Also, you can install step by step, as explained below.

---
---
## CONTINUE HERE ##
### Install transmission-daemon:

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

Install Plex: https://thepi.io/how-to-set-up-a-raspberry-pi-plex-server/

--

### Install Samba

> Note: This step is optional. Just install Samba if you want to share the folders in the internal network.

To install Samba, please, type this commands in your terminal
```
$ sudo apt-get install samba
```



Install Samba: https://help.ubuntu.com/community/How%20to%20Create%20a%20Network%20Share%20Via%20Samba%20Via%20CLI%20%28Command-line%20interface/Linux%20Terminal%29%20-%20Uncomplicated%2C%20Simple%20and%20Brief%20Way%21


## <a name="settings">Settings</a>