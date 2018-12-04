# A Build Walkthrough of ROCK 2.2

In this case, we are using VMWare Fusion 11 to build ROCK 2.2.

## Lets Get Started!

First, startup Fusion 11 and select "Create a custom virtual machine"

* Choose Linux > CentOS 7 64-bit
* Choose for boot firmware "Legacy BIOS"
* Create a new virtual disk
* Click on Continue, we will customize
* Do not click on Finish, click on Customize Settings
* Name the virtual machine filename something meaningful like rock_2-2_testvm.vmwarevm

## General Settings

The General Settings Icon box will appear along with the VM in a non-running state.

Click on General, then click on the name and rename the VM, for example the same name as the virtual machine filename: ROCK 2.2 TestVM
I recommend under the Notes section to put the username that you are going to use, such as "operator".

## Processors & Memory
* Set the Processors to 4 processor cores
* Set the Memory to 8192 MB

Add the following:
* Click on Add Device
* Double click on Network Adapter
* Select Private to my Mac
* Uncheck Connect Network Adapter

## Network Adapter

The network Adapter should be set to Connect Network Adapter checked, Share with my Mac selected

Remove the following:
* Sound Card
* Printer
* Camera

## Hard Disk

It is possible to leave the default HD size as 20 GB, really only useful for running through the motions of installing and getting initial functionality.  We recommend a larger disk size 40-80, or more.

With a default 20 GB partition, it is OK to not do any fancy disk partitioning.

If you have space, you can change the Disk Size to 40 to 80 GB or more.  The default setting is to not pre-allocate the disk, so it is a sparse file that will grow as needed, up to the partition size.

## CD/DVD (IDE)
Check the box for Connect CD/DVD Drive. Click on the dropdown menu that should say Autodetect, and select Chose a disk or disk image... Locate and select rocknsm-2.2.0.iso. Click on Open.

Click on Show All.

## Start The VM

At this point, you are ready to start the VM.

Click in the window and select Custom Install

For the ROCKNSM 2.2-1810 Installation, leave everything defatul except:
* Scroll down to Installation Destination
* Selet I will configure partitioning
* Click on Done

## Manual Partitioning

This will take you to the Manual Partitioning screen.  Click on the link Click here to create them automaticlly.

With a 20 GB drive, You will get threee partitions of:
* /boot
   * 1024 MiB
* /
   * 17 GiB
* swap
   * 2048 MiB

With this smaller partition of 20 GB, CentOS wwill not create a default /home directory.  This is fine, but if it did create one, it will allocate maximal space to the home partition.  If you desire a home directory, make it small, 1-5 GB.

Be aware that with only 8 GB of RAM given to the VM, the system will run close to swapping memory to the swap partition.  If this system is continuously monitoring traffic, such as from a small business, or home network, it will most likely run out of memory and start using the swap partition.  Ultimatly, this will result in a range of effects, from data loss, to the system becoming unstable and crashing.

Click on Done in the Manual Partitioning screen. Click on Accept Changes.

## Security Policy

For Security Policy - you do not need to select a specific security policy, "No profile selected" is OK to be left selected.  SELinux will be in enforcing mode with No profile - a good thing.

## Begin Installation

At this point you can click on Begin Installation.

Two things after installation begins:

1. It is **VERY IMPORTANT** to create a user with **SUDO** rights, meaning, the user has administrative privileges.

2. It is easier to create the user via the dialog boxes while the system is installing than from the command line upon first boot.

3. ROCK, including version 2.2, is designed to be run with root disabled.  Do not set a password for root as this enables the root account.

## User Creation with SUDO privileges

Now, once you click on Begin Installation, click on User Creation.

The screen is called Create User.  For example, enter the Full name and User name as "operator".

CLICK ON THE CHECKBOX "Make this user administrator"

Set the password

At this point, depending on how fast your system and drive is, the configuration will likely be completed.

Click on Finish configuration.

This post installation scripts will run.  The system will reboot.

## Initial setup of CentOS Linux 7 (Core)

You will be presented with a text dialog of read the licensing agreement and either approve or disapprove.

* type in 'c' to continue.

Once you do that, the screen will pop over to the ROCK spash screen with network information, including your IP address on the right side of the screen, recommend you make a note of this.

At the localhost login enter the name of the user you created, then the password.  If the password does not work, you can simply follow CentOS password reset procedures:
* https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sec-terminal_menu_editing_during_boot#sec-Recovering_Root_Password
* Reset the password for the created user, not root

# Stay tuned for part two! 
