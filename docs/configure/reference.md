<!-- ## Configuration File Overview -->

The primary configuration file for RockNSM is found at `/etc/rocknsm/config.yml`.

This file defines key information that drives the Ansible deployment playbook
like network interface setup, cpu cores assignment, and much more.  There are a
lot of options to tune here so take time to familiarize.

> A template of this file in it's entirety can be found [[here on github]](https://github.com/rocknsm/rock/blob/master/playbooks/templates/rock_config.yml.j2), but for greater clarity let's break it down into it's major sections:


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
Does your sensor have access to [upstream](https://imgs.xkcd.com/comics/the_cloud.png)
online repositories? If so, then make sure that this value is set to
`rock_online_install: True`.


#### Offline
If you are in an offline environment, then set it to `rock_online_install: False`.
Ansible will deploy using the locally cached files found in `/srv/rocknsm`.

<br>
> Note: In our next release, the default behavior will be changed to an offline
install (reference [Issue #376](https://github.com/rocknsm/rock/issues/376))

### Data Retention
This section controls how long NSM data stays on the sensor:
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

### Component Options
This is a critical section that provides boolean options to choose what components of ROCK are **_installed_** and **_enabled_** during deployment.

```yml
rock_services:
  - name: bro
    quota_weight: 1
    installed: True
    enabled: True

  - name: stenographer
    quota_weight: 8
    installed: True
    enabled: True

  - name: docket
    quota_weight: 0
    installed: True
    enabled: True

  - name: suricata
    quota_weight: 2
    installed: True
    enabled: True

  - name: elasticsearch
    quota_weight: 4
    installed: True
    enabled: True

  - name: kibana
    quota_weight: 0
    installed: True
    enabled: True

  - name: zookeeper
    quota_weight: 0
    installed: True
    enabled: True

  - name: kafka
    quota_weight: 4
    installed: True
    enabled: True

  - name: lighttpd
    quota_weight: 0
    installed: True
    enabled: True

  - name: fsf
    quota_weight: 1
    installed: True
    enabled: True

  - name: filebeat
    quota_weight: 0
    installed: True
    enabled: True
```

A good example for changing this section would involve [Stenographer](../services/stenographer.md). Collecting raw PCAP is resource and _**storage intensive**_.  Your machine may not be able to handle that, and if you just wanted to focus on network logs, then you would set both options in the config file to **disable** installing and enabling Stenographer.
