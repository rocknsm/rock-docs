# Configuration

After initial installation, your newly minted sensor will need to be configured
for your environment.  This can be done by logging in locally, or remotely via `ssh`.

> ROCK has been designed to require as little configuration as possible out of the
box. This document covers much of gear turning available to advanced users, but
please know up front that you can simply **[run the deploy script](../deployment/index.md)**
and get a working sensor.  

With that said, let's get into the 2 main configuration files found in `/etc/rocknsm/`.  


## Hosts File

The first file you may want to edit is `/etc/rocknsm/hosts.ini`. This
file is an [Ansible inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) file that defines the target machines when
running a playbook.  

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


## Config File

The next file ([/etc/rocknsm/config.yml](https://github.com/rocknsm/rock/blob/master/playbooks/templates/rock_config.yml.j2)) drives
the Ansible playbook and contains key variables like network interface setup,
cpu cores assignment, and much more.  There are a lot of options to tune here so
take time to familiarize.  Let's break down this file into it's major sections:  


### Network Interface
As mentioned previously, ROCK takes the interface with an ip address / gateway and will use that as the _management_ NIC. `config.yml` displays the remaining interfaces that will be used to **MONITOR** traffic.

Let's run through a basic example:  
```
[admin@rock ~]$ ip a

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether ...
    inet 192.168.1.207/24 brd 192.168.1.255 scope global noprefixroute dynamic enp0s3
    ...
3: enp0s4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether ...
```

The demo box above has 2 NICs:  
1. `enp0s3` - is plugged in for install and deployment with an ip address from local dhcp. This will be used to **manage** the sensor  
2. `enp0s4` - will be unused (not connected) during install and deployment and be listed as a `rock_monif` in the config file

The config file shows the other interface (`enp0s3`) is listed as MONITOR interface.
```yml
# interfaces that should be configured for sensor applications
rock_monifs:
    - enp0s3
```


### Sensor Resource

```yml
# Set the hostname of the sensor:
rock_hostname: rocknsm_sensor_1

# Set the Fully Qualified Domain Name:
rock_fqdn: rocknsm_sensor_1.rocknsm.lan

# Set the number of CPUs assigned to Bro:
bro_cpu: 2

# Set the Elasticsearch cluster name:
es_cluster_name: rocknsm

# Set the Elasticsearch cluster node name:
es_node_name: localhost

# Set the value of Elasticsearch memory:
es_mem: 5
```

### Installation Source
We've taken into consideration that your sensor won't always have internet
access.  Currently the default value is set to `rock_online_install: True`:  

```yml
  # The primary installation variable defines the ROCK installation method:
  # ONLINE:   used if the system may reach out to the internet
  # OFFLINE:  used if the system may *NOT* reach out to the internet
  # The default value "False" will deploy using OFFLINE (local) repos.
  # A value of "True" will perform an install using ONLINE mirrors.

  rock_online_install: True
```

#### Online
Does your sensor has access to [upstream](https://imgs.xkcd.com/comics/the_cloud.png)
online repositories? If so, then make sure that this value is set to
`rock_online_install: True`.  


#### Offline
If you are in an offline environment, then set it to `rock_online_install: False`.
Ansible will deploy using the locally cached files found in `/srv/rocknsm`.

<br>
> Note: In our next release the default behavior will be changed to an offline
install (reference [Issue #376](https://github.com/rocknsm/rock/issues/376))

### Data Retention
This section controls how long NSM data stay on the sensor:  
```yml
# Set the interval in which Elasticsearch indexes are closed:
elastic_close_interval: 15

# Set the interval in which Elasticsearch indexes are deleted:
elastic_delete_interval: 60

# Set value for Kafka retention (in hours):
kafka_retention: 168

# Set value for Bro log retention (in days):
bro_log_retention: 0

# Set value for Bro statistics log retention (in days):
bro_stats_retention: 0

# Set how often logrotate will roll Suricata log (in days):
suricata_retention: 3

# Set value for FSF log retention (in days):
fsf_retention: 3
```

### ROCK Component Options
This is a critical section that provides boolean options to choose what components of ROCK are **_installed_** and **_enabled_** during deployment.  

```yml
# The following "with_" statements define what components of RockNSM are
# installed when running the deploy script:

with_stenographer: True
with_docket: True
with_bro: True
with_suricata: True
with_snort: True
with_suricata_update: True
with_logstash: True
with_elasticsearch: True
with_kibana: True
with_zookeeper: True
with_kafka: True
with_lighttpd: True
with_fsf: True

# The following "enable_" statements define what RockNSM component services
# are enabled (start automatically on system boot):

enable_stenographer: True
enable_docket: True
enable_bro: True
enable_suricata: True
enable_snort: True
enable_suricata_update: True
enable_logstash: True
enable_elasticsearch: True
enable_kibana: True
enable_zookeeper: True
enable_kafka: True
enable_lighttpd: True
enable_fsf: True
```

A good example for changing this section would involve [Stenographer](../services/stenographer.md). Collecting raw PCAP is resource and _**storage intensive**_.  You're machine may not be able to handle that and if you just wanted to focus on network logs, then you would set both options in the config file to **disable** installing and enabling Stenographer:  

```yml
with_stenographer: False
  ...
  ...
  ...
enable_stenographer: False
```
