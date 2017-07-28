# Installation


## ISO

The ISO file is the preferred method and can be found [here](https://github.com/rocknsm/rock/releases).  Once booted to the ISO, complete the automated install, and reboot.

Upon login, run:
`/opt/rocknsm/rock/bin/deploy_rock.sh`  This will accept all the default values.

NOTE:  If you need details on how to apply the image to your USB or optical disk, see [media prep](media_prep.md).


## Github

If you already have a clean Centos7 install, you can also clone the latest [ROCK](https://github.com/rocknsm/rock) repo. The instructions for the ISO above uses a snapshot of the `master` branch.

* clone the repo: `git clone https://github.com/rocknsm/rock.git`

You can simply run the `/opt/rocknsm/rock/bin/generate_defaults.sh` script with `sudo`. This will generate the file `/etc/rocknsm/config.yml`.


## Vagrant Build

The current Vagrantfile is configured to give the VM 8GB of RAM.  If your system can't do that you should buy a new system or adjust the `vm.memory` value.  Anything below 8 is going to run like :poop:. You will also need to have an additional host-only adapter configured named `vboxnet0`.

```
git clone https://github.com/rocknsm/rock.git
cd rock
vagrant up
```

---

When installation is complete, continue to the [Usage Guide](usage.md).
