# Alternate Install Options

## Github

A system running ROCK should have at least **2 NICs** and **8GB RAM**, preferably more.  With a clean OS (RHEL or CentOS 7) ready, let's install some dependencies.

### Dependencies

* update / reboot

  * `sudo yum update -y && reboot`


* add EPEL repo

  * `sudo yum install -y epel-release`


* install git / ansible

  * `sudo yum install -y git ansible`



### Clone Repo / Generate Defaults

Make sure you're in your home directory, then download the latest bits by cloning the latest [ROCK](https://github.com/rocknsm/rock) repo:

* `cd`
* `git clone https://github.com/rocknsm/rock.git`

After applying updates ROCK needs a default configuration to build upon.  This is done by running the aptly named named script as the admin user you created:

*  `cd /rock/bin`

*  `sudo ./generate_defaults.sh`

*  when successful you will see: "*Defaults generated. Adjust /etc/rocknsm/config.yml as needed.*"


### Customize Configuration

One of the primary tasks complete by the previous step is the creation of the file `/etc/rocknsm/config.yml`.  This file contains key variables like network interface setup, cpu cores used, what components are enabled, and more.

> TIP: take care with these options as this file will be read during the next step, deployment.


## Deploy

Once your config file is tuned to your situation, it's time to deploy!  This is done by running the deployment script:

*  `cd`
*  `cd /rock/bin/`

*  `sudo ./deploy_rock.sh`

If everything is well, this should set up all the components you selected and give you a success banner similar to the example below:

```
PLAY RECAP ********************************************************************
simplerockbuild.simplerock.lan : ok=40   changed=2    unreachable=0    failed=0
```


## Vagrant Build

The current Vagrantfile is configured to give the VM 8GB of RAM.  If your system can't do that you should buy a new system or adjust the `vm.memory` value.  Anything below 8 is going to run like :poop:. You will also need to have an additional host-only adapter configured named `vboxnet0`.

```
git clone https://github.com/rocknsm/rock.git
cd rock
vagrant up
```

---

Continue to the [Usage Guide](usage.md).
