# Installation Guide

TL;DR - Installation is simple and straighforward.

-  apply image
-  generate defaults
-  confirm / edit config
-  deploy


## Apply the Image

Installing from the [ISO](https://github.com/rocknsm/rock/releases) is the preferred method to set up ROCK.  If that's for some reason not an option, alternate methods are listed [here](alt_install.md).

> NOTE: if you need details on how to apply the image to your USB or optical disk, see [media prep](media_prep.md).

-  once booted to the live image, select the automated install and 'ENTER'.

-  click **User Creation** at the next screen complete the required fields to set up a non-root admin user.  If this step is not completed now do not fear, you will be prompted to create this account after first login.

<p align="center">
<img src="user_creation.png">
</p>

-  click **Finish Installation** and wait for reboot

-  accept licensing agreement: `c` + "*enter*"

-  update Centos to current by running: `sudo yum update -y && reboot`


<!-- ## Generate Defaults

After applying updates ROCK needs a default configuration to build upon.  This is done by running the aptly named named script as the admin user you created:

-  `cd /opt/rocknsm/rock`

-  `sudo ./generate_defaults.sh`

-  if this is successful you will see:

"*Defaults generated. Adjust /etc/rocknsm/config.yml as needed.*" -->


## Customize Configuration

One of the primary tasks complete during install is the creation of the file `/etc/rocknsm/config.yml`.  This file contains key variables like network interface setup, cpu cores used, what components are enabled, and more.

> TIP: take care with these options as this file will be read during the next step, deployment.

For example:  if you wish to run an offline install (the ISO sets you up for this already) edit `/etc/rocknsm/config.yml` and change the following (line 30):

```
rock_online_install: False
```

If this value is set to `True`, Ansible will configure your system for the yum repositories listed and pull packages and git repos directly from the URLs given. You could easily point this to local mirrors, if needed.

If this value is set to `False`, Ansible will look for the cached files in `/srv/rocknsm`. There is another script called `offline-snapshot.sh` that will create the necessary repository and file structure. Run this from a system that is Internet connected and copy it to your sensors for offline deployment.

While you're in there, you can change the auto-detected defaults, such as which interfaces to use, hostname, fqdn, resources to use, etc. You can also disable features altogether at the bottom by simply changing the feature value to `False` as shown below. Don't do this unless you know what you're doing.

```
with_nginx: False
```

This disables nginx from installing or being configured. Note that it will not remove it if it is already present.


## Deploy

Once your config file is tuned to your situation, it's time to deploy!  This is done by running the deployment script:

-  `cd /opt/rocknsm/rock/bin/`

-  `sudo ./deploy_rock.sh`

If everything is well, this should set up all the components you selected and give you a success banner similar to the example below:

```
PLAY RECAP ********************************************************************
simplerockbuild.simplerock.lan : ok=40   changed=2    unreachable=0    failed=0
```

---

Continue to the [Usage Guide](usage.md).

> NOTE: for a detailed guide on how to set up a virtual machine to throw packets at see the [VM Build Guide](../dev/vm_guide.md) wiki/dev section.
