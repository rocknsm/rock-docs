# Installation
<!-- Derek Ditch <derek@rocknsm.io>; Jeff Geiger <jeff@rocknsm.io>
:icons: font
:experimental: -->

## TL;DR

Download the ISO indicated in <<Using the ISO>>, complete the installation and reboot. Upon login, run:
`/opt/rocknsm/rock/bin/deploy_rock.sh`
This will accept all the default values.

Read on for more details and configuration options.

## Media Prep

### ISO

Download the ISO from the https://github.com/rocknsm/rock/releases[Releases page]

### Bootable USB

* Prep Install Media
** If you live in the terminal, use `dd` to apply the image
```
diskutil list
diskutil unmountDisk /dev/disk#
sudo dd bs=8M if=path/to/rockiso of=/dev/disk#
```

NOTE: If using the terminal is currently a barrier to getting things rolling, http://etcher.io[etcher.io] is a solid gui-based burning utility

linktoISO
linktoVAGR
linktoGIT
