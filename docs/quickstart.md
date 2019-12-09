# ROCK Quickstart

This is a _**hasty**_ guide to get right into building your very own sensor, just
for users already familiar with building sensors and know what they're doing.

If you're not an NSM ninja, you can start building from the beginning of the full docs [here](install/requirements.md).  


### Getting the Bits
Download the lastest ROCK build from [download.rocknsm.io](https://download.rocknsm.io/isos/stable/)
and create a bootable disk using your favorite burning utility.  


### Install Rock
1. If you have a network connection available, plug it into the management port
1. Select the **Custom Install** at initial boot
1. Configure disk partitions to suit your needs
1. Create an administrative user
1. Reboot and log back in as admin user


### Configure & Deploy ROCK
1. Familiarize with the updated ROCK commands / options by running $`rock`
1. Run $`sudo rock setup`
1. Follow each step of the setup TUI by the numbers
1. Deploy your sensor by executing the last setup option "Run Installer"


---

## Next Up
A good next step would be the [usage](./usage/index.md) section for details on doing basic functions checks before plugging into the stream.
