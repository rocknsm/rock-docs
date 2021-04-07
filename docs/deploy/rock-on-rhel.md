# Rock on RHEL
We are ofthen asked how deploy rock on RHEL. This should work for both a single node deployment and a multi-node deployment.

Install RHEL using the same guidelines outlined in [Install Section](docs\install\install.md) of the documentation.

If you have not done so already, register the RHEL OS.
```
[root@server1 ~]# subscription-manager register --username admin-example --password secret
```
It should reply back with something like this:
```
The system has been registered with id: 7d133d55-876f-4f47-83eb-0ee931cb0a97
```
To aid in the installation make sure that you have the [latest ISO](https://mirror.rocknsm.io/isos/stable/) downloaded on the machine via `scp` or some other avenue.

## Disable FIPS to allow Deployment on all components
> **If** your STIG enabled FIPS you will need to disable it on certain machines. The machines that contain Bro/Zeek, Docket, and Stenographer will need to be disabled.


Remove the dracut-fips* packages:

 ```
sudo yum remove dracut-fips\*
```

Backup existing FIPS initramfs
 ```
sudo mv -v /boot/initramfs-$(uname -r).img{,.FIPS-bak}
```

Run dracut to rebuild the initramfs
```
sudo dracut
 ```

Run Grubby
```
sudo grubby --update-kernel=ALL --remove-args=fips=1
```

Carefully update the grub config file setting fips=0

  ```
sudo vi /etc/default/grub
```

Reboot the VM
```
sudo reboot
```

Log back in...

Confirm that fips is disabled by
```
sysctl crypto.fips_enabled
```

if it returns `0` then it has been properly disabled



## Deployment of Rock across All Machines
Mount the latest iso in this case its rocknsm2-4.iso to `/mnt`

Copy the folders form the mounted device to `/srv/rocknsm`

Create the a place for your pet ROCK to live
```
sudo mkdir -p /usr/share/rock
```

Git Clone or Copy the rocknsm repo to the `/usr/share/rock` directory
```
sudo git clone https://github.com/rocknsm/rock.git
```

Install Ansible to coordinate the installation of the Sensor
```
sudo yum install ansible
```

Ensure the latest version of markupsafe is installed also
```
sudo yum install python2-markupsafe
```

Copy the hosts.ini file that so ansible knows where to deploy things using `sudo cp /usr/share/rock/etc/rocknsm/hosts.ini /etc/rocknsm/.`

> NOTE: Most of the Rock configuration is now automated and can be called from anywhere on the os.

```
[admin@sensor ~]$ sudo rock help
Usage: /sbin/rock COMMAND [options]
Commands:
setup               Launch TUI to configure this host for deployment
tui                 Alias for setup
ssh-config          Configure hosts in inventory to use key-based auth (multinode)
deploy              Deploy selected ROCK components
deploy-offline      Same as deploy --offline (Default ISO behavior)
deploy-online       Same as deploy --online
stop                Stop all ROCK services
start               Start all ROCK services
restart             Restart all ROCK services
status              Report status for all ROCK services
genconfig           Generate default configuration based on current system
destroy             Destroy all ROCK data: indexes, logs, PCAP, i.e. EVERYTHING
                      NOTE: Will not remove any services, just the data

Options:
--config, -c <config_yaml>         Specify full path to configuration overrides
--extra, -e <ansible variables>    Set additional variables as key=value or YAML/JSON passed to ansible-playbook
--help, -h                         Show this usage information
--inventory, -i <inventory_path>   Specify path to Ansible inventory file
--limit <host>                     Specify host to run plays
--list-hosts                       Outputs a list of matching hosts; does not execute anything else
--list-tags                        List all available tags
--list-tasks                       List all tasks that would be executed
--offline, -o                      Deploy ROCK using only local repos (Default ISO behavior)
--online, -O                       Deploy ROCK using online repos
--playbook, -p <playbook_path>     Specify path to Ansible playbook file
--skip-tags <tags>                 Only run plays and tasks whose tags do not match these values
--tags, -t <tags>                  Only run plays and tasks tagged with these values
--verbose, -v                      Increase verbosity of ansible-playbook
```

Change Directory into `usr/share/rock/bin` if you are not already there

Run `sudo ./rock ssh-config` to setup ssh on all the host you will use for the deployment. It uses the host from the previously created `hosts.ini` if you have a multinode deployment

Run `sudo ./rock genconfig` to generate config file. Unless you are doing something really off the beaten path of a normal deployment you should not need to edit this file.

Ensure you are in the `/usr/share/rock/bin/` directory.

Fire off the installation

```
sudo ./rock deploy-offline
```
Once the deployment is completed with the components you chose, you'll be
congratulated with a success banner. Congratulations!

<p align="center">
<img src="../../img/install_banner.png">
</p>


Ensure the following ports on the firewall are open if you need them to be
  - 9300 TCP - Node coordination (I am sure elastic has abetter name for this)
  - 9200 TCP - Elasticsearch
  - 5601 TCP - Kibna
  - 22 TCP - SSH Access
  - 9092 TCP - Kafka

  ```
  sudo firewall-cmd --add-port=9300/tcp --permanent
  ```

Reload the firewall config
```
sudo firewall-cmd --reload
```

Check the Suricata `threads` per interface. This is so Suricata doesn't compete with Zeek for CPU threads. If you are listening on multiple interfaces, then you will have to set threads for all of them.


```yml
%YAML 1.1
---
default-rule-path: "/var/lib/suricata/rules"
rule-files:
  - suricata.rules

af-packet:
  - interface: em3
    threads: 4 <---------
    cluster-id: 98
    cluster-type: cluster_flow
    defrag: yes
    use-mmap: yes
    mmap-locked: yes
    #rollover: yes
    tpacket-v3: yes
    use-emergency-flush: yes
default-log-dir: /data/suricata
```

CONGRATZ!!! You now have ROCK NSM of RHEL
