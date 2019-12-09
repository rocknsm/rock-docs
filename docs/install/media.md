# Install Media

If there’s one thing that should be carried away from the installation section, it's this:  

RockNSM has been designed to be used as a security distribution, not a package or a suite of tools. It’s built from the ground up and the ONLY SUPPORTED INSTALL IS THE OFFICIAL ISO.

Yes, one can clone the project and run the Ansible on some bespoke CentOS build, and you may have great success... but you've **voided the warranty**.  Providing a clean product that makes supporting submitted issues is important to us.  The ISO addresses most use cases.


## Download

The lastest ROCK build is available at [download.rocknsm.io](https://download.rocknsm.io/isos/stable/).


## Applying the ISO

Now it's time to create a bootable USB drive with the fresh ROCK build.  Let's look at few options.   

### Linux

#### CLI

If you live in the terminal, use `dd` to apply the image.  These instructions are for using a RHEL based system.  If you're in a different environment, google is your friend.  

> **CAUTION** when using these commands by **ENSURING** you're writing to the correct disk / partition!

1. once you've inserted a USB get the drive ID:  
`lsblk`  

2. unmount the target drive so you can write to it:  
`umount /dev/disk#`  

3. write the image to drive:  
`sudo dd bs=8M if=path/to/rockiso of=/dev/disk#`  

#### GUI

If you don't want to apply the image in the terminal, there are plenty of great tools to do this with a graphical interface:

- [Etcher](http://etcher.io) - our go-to choice (cross-platform)
- [SD Card Formatter](https://www.sdcard.org/downloads/formatter_4/) - works well
- [YUMI](https://www.pendrivelinux.com/yumi-multiboot-usb-creator/) - create multibooting disk

> **Note** while we do not want to dictate what tool you use, we've received reports when using Rufus, a popular Windows based tool, to make bootable media. We reported this on Feb 26 https://twitter.com/rocknsm/status/1100517122021748737. The above GUI tools have been proven to work.

### macOS

#### CLI

For the terminal, we'll once again use `dd`, but with a few differences from the linux instructions above.

> **CAUTION** when using these commands by **ENSURING** you're writing to the correct disk / partition!

1. once you've inserted a USB get the drive ID:  
`diskutil list`  

2. unmount the target drive so you can write to it:  
`diskutil unmount /dev/disk#`  

3. write the image to drive:  
`sudo dd bs=8m if=path/to/rockiso of=/dev/disk#`  

#### GUI

- [Etcher](http://etcher.io) - our defacto tool


### Windows

When applying ISO on a Windows box our experience is with graphical applications entirely.  Here's a list of what works well:

- [Etcher](http://etcher.io) - our defacto tool
- [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)
- [SD Card Formatter](https://www.sdcard.org/downloads/formatter_4/)
- [Rufus](https://rufus.ie/) - (we recently [encountered an issue](https://twitter.com/rocknsm/status/1100517122021748737) with Rufus
and v2.3 -- 2/26/19)
