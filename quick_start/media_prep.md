# Media Prep

## ISO

Download the ISO from the [releases](https://github.com/rocknsm/rock/releases) page.

## Bootable USB

* Prep Install Media
  * If you live in the terminal, use `dd` to apply the image

```
diskutil list
diskutil unmountDisk /dev/disk#
sudo dd bs=8M if=path/to/rockiso of=/dev/disk#
```

NOTE: If using the terminal is currently a barrier to getting things rolling, http://etcher.io[etcher.io] is an excellent gui-based burning utility.
