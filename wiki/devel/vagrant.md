# Vagrant Build
<!-- Derek Ditch <derek@rocknsm.io>; Jeff Geiger <jeff@rocknsm.io>
:icons: font
:experimental: -->

The current Vagrantfile is configured to give the VM 8GB of RAM.  If your system can't do that you should buy a new system or adjust the `vm.memory` value.  Anything below 8 is going to run like poopoo. You will also need to have an additional host-only adapter configured named `vboxnet0`.

```
git clone https://github.com/rocknsm/rock.git
cd rock
vagrant up
```
