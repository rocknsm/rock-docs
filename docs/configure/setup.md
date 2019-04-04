After initial installation, your newly minted sensor will need to be configured
for your environment.  This can be done by logging in locally, or remotely via `ssh`.

> ROCK has been designed to require as little configuration as possible out of the
box. This document covers much of gear turning available to advanced users, but
please know up front that you can simply run $`sudo rock deploy` to get a working
sensor.

With that said, let's get into the 2 main configuration files found in `/etc/rocknsm/`.  


## Hosts File

The first file you may want to edit is `/etc/rocknsm/hosts.ini`. This
file is an [Ansible inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html)
file that defines the target machines when running a playbook.  

If you edit this file in a simple standalone sensor, you're essentially changing
the hostname of your sensor.  

<!-- This is also where you break out server roles for more complex multi-node
deployments. If that fits your needs, see the multi-node clustering guide [here](#). -->

```ini
[rock]
simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local

[web]
simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local

[sensors:children]
rock

[bro:children]
sensors
...
...
...
```

As you can see in the above example, the default hostname is `simplerockbuild.simplerock.lan`.
To customize this, simply replace _all_ simplerock entries with your own.  










---

For more detail on each section of the main ROCK config file, see the [Config File Overview]().
