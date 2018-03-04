# VM Build Guide

The following walkthrough is based on VMware Fusion, but serves well as a general template to follow.

> The more resources you give ROCK, the happier it'll be.

## New VM

* in the top left corner click "*Add > New... then Custom Machine*"
* select the "*Linux > RedHat Enterprise 64 template*"
* create new virtual disk
* name your VM, save

Lets customize some settings, change based on your hardware.

* **Processors & Memory**
  * Processors - 4 cores
  * Memory - 8192MB (8GB)


* **Hard Disk**
  * increase the disk to 20GB
  * customize settings
  * save as name


* **Network Adapter**
  * By default the vm is created with one interface - this will be for management.
  * lets add a second (listening) interface:
  * add device (top right), net adapter, add, “private to my mac”


* **Boot Device**
  * click CD/DVD (IDE)
  * check the "Connect CD/DVD Drive" box
  * expand advanced options and browse to the latest ROCK iso


* **Run Auto Installer**

Once the above changes are made, it's time to install the OS.  Lets run the "Auto Install", but before we do, there are some customization that can be done for VMs:

* click the "*Start Up*" button while holding the `esc` key

* hit `tab` for full config options

* add the following values, speparated by spaces:
  * `biosdevname=0`

  * `net.ifnames=0` - this will ensure you get interface names like `eth0`. If you have physical hardware, I _highly_ recommend that you do not use this function

  * `vga=773` - improves video resolution issues

* **ENTER**, and ROCK install script will install
* create _**admin**_ user acct
* **REBOOT** when install process is complete

TIP: The `root` account is locked by default and the user account you created has `sudo` access.

### Updating

> NOTE: VMware Fusion will allow local ssh out of the box.  If you're using Virtualbox you'll need to set up local [ssh port forwarding](https://nsrc.org/workshops/2014/btnog/raw-attachment/wiki/Track2Agenda/ex-virtualbox-portforward-ssh.htm).

Log in with the admin credentials used during the install process, and lets get this box current:
```
sudo yum update -y && reboot
```

Now you're ready to move on to [Usage Guide](../../overview/quick_start/usage.md).
