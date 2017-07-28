# VM Build Guide

The following walkthrough is based on VMware Fusion, but serves as a general template.  And as always - the more resources you give ROCK, the happier it'll be.

* *New VM Setup*

** in the top left corner click add > new... then custom machine
** select the Linux > RedHat Enterprise 64 template
** create new virtual disk
** name your VM, save

Lets customize some settings, change based on your hardware.

* *Processors & Memory*
** Processors - 4 cores
** Memory - 8192MB (8GB)

* *Hard Disk*
** increase the disk to 20GB
** customize settings
** save as name

* *Network Adapter*
** By default the vm is created with one interface - this will be for management.
** lets add a second (listening) interface:
*** add device (top right), net adapter, add, “private to my mac”

* *Boot Device*

** click CD/DVD (IDE)
** check the "Connect CD/DVD Drive" box
** expand advanced options and browse to the latest ROCK iso

* *Run Auto Installer*

Once the above changes are made, it's time to install the OS.  There is also a "Custom Install" option that gives more granular control, but lets run the "Auto" for now and make this ROCK-n-roll:

** click the "Start Up" button while holding the `esc` key
** hit `tab` for full config options
** add the following values, speparated by spaces: +
*** `biosdevname=0` +
*** `net.ifnames=0` This will ensure you get interface names like `eth0`. If you have physical hardware, I _highly_ recommend that you do not use this function. +
*** `vga=773` +
* ENTER, and ROCK install script will install
* create _*admin*_ user acct
* REBOOT when install process is complete

TIP: The `root` account is locked by default and the user account you created has `sudo` access.

### Updating

NOTE: VMware Fusion will allow local ssh out of the box.  If you're using Virtualbox you'll need to set up local port forwarding.

Log in with the admin credentials used during the install process, and lets get this box current:
```
sudo yum update -y && reboot
sudo yum install -y epel-release
sudo yum install -y git ansible
```

You're now ready for link:content/installation.adoc[Installation]
