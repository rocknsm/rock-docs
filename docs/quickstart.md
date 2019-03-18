# ROCK Quickstart

This is a _**hasty**_ guide to get right into building your very own sensor, just
for users already familiar with building sensors and know what they're doing.

If you're not an NSM ninja, you can start building from the beginning of the full docs [here](install/requirements.md).  


### Getting the Bits
Download the lastest ROCK build from [download.rocknsm.io](https://download.rocknsm.io/isos/stable/)
and create a bootable disk using your favorite burning utility.  


### Install Rock
1. If you have a network connection available, plug it into the management port
1. Select the Custom Install at initial boot
1. Configure disk partitions to suit your needs
1. Create an administrative user
1. Reboot and log back in as admin user


### Configure ROCK
1. Customize the hostname of the box in `/etc/rocknsm/hosts.ini`
1. Review each major section of the config in `/etc/rocknsm/config.yml`


### Deploy
1. Kick off the Ansible deployment process by running `sudo deploy_rock.sh`
1. Run `sudo generate_defaults.sh` should you mess up your config file


---

## Next Up
A good next step would be the [usage](./usage/index.md) section for details on doing basic functions checks before plugging into the stream.
