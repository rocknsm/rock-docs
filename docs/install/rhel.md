# ROCK on RHEL

|   RESOURCE  |     RECOMMENDATION |
| ----------- | ------------------ |
| CPU         | **4+** physical cores |
| Memory      | **8GB** RAM minimum, the more the better ) |
| Storage     | **256GB**, with 200+ of that dedicated to `/data`, SSD preferred |
| Network     | **2 gigabit interfaces**, one for management and one for collection |


**IF** using in a VM environment set the following during OS installation  

* click the "*Start Up*" button for the VM while holding the `esc` key

* hit `tab` for full config options

* add the following values to the automated or custom install, separated by spaces:
  * `biosdevname=0`

  * `net.ifnames=0` - this will ensure you get interface names like `eth0`. If you have physical hardware, I _highly_ recommend that you do not use this function

  * `vga=773` - improves video resolution issues

* **ENTER**, and ROCK install script will install
* create _**admin**_ user acct
* **REBOOT** when install process is complete

TIP: The `root` account is locked by default and the user account you created has `sudo` access.


* Setup Access to RHEL rpm Repos:
```
sudo subscription-manager register --username [some user] --password [some password] --auto-attach
```

* Once installed get the dependencies for deployment out of the way.
```
sudo yum update -y
sudo yum install -y yum-cron wget dracut ansible
sudo systemctl enable yum-cron
sudo systemctl start yum-cron
```

To Allow Installation We need to disable FIPS:

* Remove the dracut-fips* packages
  ```
  sudo yum remove dracut-fips\*
  ```
* Backup existing FIPS initramfs
  ```
  sudo mv -v /boot/initramfs-$(uname -r).img{,.FIPS-bak}
  ```
* Run `dracut` to rebuild the initramfs
  ```
  sudo dracut
  ```
* Run Grubby
  ```
  sudo grubby --update-kernel=ALL --remove-args=fips=1
  ```
* **Carefully** up date the grub config file setting `fips=0`
  ```
  sudo vi /etc/default/grub
  ```
* Reboot the machine
  ```
  sudo reboot
  ```
* Log back in.

* Confirm that fips is disabled by running the command below. If it returns `0` then it has been properly disabled

  ```
  sysctl crypto.fips_enabled
  ```

Clone ROCK NSM Repo
* Navigate to directory for the git cloning process
  ```
  cd /usr/share/
  ```
* Clone the Repo
  ```
  sudo git clone https://github.com/rocknsm/rock.git
  ```

Deploy ROCK

* Rock pull from the Github repo will not have a host.ini file so we have to build one.
  ```
  sudo mkdir /etc/rocknsm
  ```
* Create the file
  ```
  sudo vi /etc/rocknsm/hosts.ini
  ```

* Add this config for a single unit deployment or add additional configs for a multi node deployment here

  ```
  [rock]
    simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local
  ```

* Navigate to the rock bin directory
  ```
  cd rock/bin
  ```
* Generate defaults for rock to deploy with
  ```
  sudo sh generate_defaults.sh
  ```
* Adjust in accordance with you needs and then
   ```
  sudo sh deploy_rock.sh
  ```
From there it should work along the same lines of the RockNSM CENTOS Iso.
