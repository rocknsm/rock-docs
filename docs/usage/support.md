# Support Guide

This section aims to smooth out the most frequent issues new users will run into.

### Suricata Service Fails to Start
This can occur after successful installation of the ROCK sensor.

To identify if this is an issue, run `sudo rockctl status` and you'll see
```
SURICATA:
    Active: failed (Result: exit-code) since Mon 2020-01-06 01:00:57 UTC; 40min ago
```
To validate, run run `sudo journalctl -u suricata` and look for the `MemoryDenyWriteExecute`, meaning Suricata is using more RAM than is available. We need to tamp 'er down.
```
sudo journalctl -u suricata
-- Logs begin at Sun 2020-01-05 22:14:04 UTC, end at Mon 2020-01-06 01:42:58 UTC. --
Jan 05 22:57:54 rock-1.rock.lan systemd[1]: [/usr/lib/systemd/system/suricata.service:17] Unknown lvalue 'MemoryDenyWriteExecute' in section 'Service'
Jan 05 22:57:54 rock-1.rock.lan systemd[1]: [/usr/lib/systemd/system/suricata.service:18] Unknown lvalue 'LockPersonality' in section 'Service'
Jan 05 22:57:54 rock-1.rock.lan systemd[1]: [/usr/lib/systemd/system/suricata.service:19] Unknown lvalue 'ProtectControlGroups' in section 'Service'
Jan 05 22:57:54 rock-1.rock.lan systemd[1]: [/usr/lib/systemd/system/suricata.service:20] Unknown lvalue 'ProtectKernelModules' in section 'Service'
Jan 05 22:58:05 rock-1.rock.lan systemd[1]: Started Suricata Intrusion Detection Service.
```
To fix this issue, identify the non-management interface that is connected by using `ip link` and looking for the interface that has `BROADCAST` and `state UP`. In this example, `ens192f1` is `UP` (`ens193` is the management interface).
```
ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: ens193: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 00:50:56:9f:c1:4e brd ff:ff:ff:ff:ff:ff
3: ens192f0: <NO-CARRIER,BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc mq state DOWN mode DEFAULT group default qlen 1000
    link/ether f8:f2:1e:34:0f:40 brd ff:ff:ff:ff:ff:ff
4: ens192f1: <BROADCAST,MULTICAST,PROMISC,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether f8:f2:1e:34:0f:41 brd ff:ff:ff:ff:ff:ff
5: ens256f0: <NO-CARRIER,BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc mq state DOWN mode DEFAULT group default qlen 1000
    link/ether f8:f2:1e:34:0a:80 brd ff:ff:ff:ff:ff:ff
6: ens256f1: <NO-CARRIER,BROADCAST,MULTICAST,PROMISC,UP> mtu 1500 qdisc mq state DOWN mode DEFAULT group default qlen 1000
    link/ether f8:f2:1e:34:0a:81 brd ff:ff:ff:ff:ff:ff
```
`sudo vi /etc/suricata/rocknsm-overrides.yaml` and comment out everything under the `af-packet` heading with the exception of the connected non-management interface and setting the `threads` from `auto` to `12` (in our example, but you may want to use a different number based on your environment). Example:
```
af-packet:
#  - interface: ens192f0
#    #threads: auto
#    cluster-id: 99
#    cluster-type: cluster_flow
#    defrag: true
#    use-mmap: true
#    mmap-locked: true
#    #rollover: true
#    tpacket-v3: true
#    use-emergency-flush: true
  - interface: ens192f1
    threads: 12
    cluster-id: 98
    cluster-type: cluster_flow
    defrag: true
    use-mmap: true
    mmap-locked: true
    #rollover: true
    tpacket-v3: true
    use-emergency-flush: true
#  - interface: ens256f1
#    #threads: auto
#    cluster-id: 97
#    cluster-type: cluster_flow
#    defrag: true
#    use-mmap: true
#    mmap-locked: true
#    #rollover: true
#    tpacket-v3: true
#    use-emergency-flush: true
#  - interface: ens256f0
#    #threads: auto
#    cluster-id: 96
#    cluster-type: cluster_flow
#    defrag: true
#    use-mmap: true
#    mmap-locked: true
#    #rollover: true
#    tpacket-v3: true
#    use-emergency-flush: true
```
Afterwards, restart `sudo rockctl status` and verify everything is started:
```
SURICATA:
    Active: active (running) since Mon 2020-01-06 01:55:37 UTC; 1min 28s ago
```

## Autodetect Assumptions

When writing the scripts to generate default values, we had to make some
assumptions. The defaults are generated according to these assumptions and
should generally work if your sensor aligns with them. That said, these
assumptions will give you a working sensor, but may need some love for higher
performance. If you cannot meet these assumptions, look at the indicated
configuration variables in `/etc/rocknsm/config.yml` for workaround approaches
(with impact on performance).  

> TIP: We assume that any interface that does not have a default route will be used for collection. Each sensor application will be configured accordingly.

**WARNING**: This so far has been the number one problem with a fresh install
for beta testers!! Check your interface configuration!!

* Two Network Interfaces:
    * a management interface with a default route
    * an interface without a default route (defined by `rock_monifs`)

* You have mounted your largest storage volume(s) under `/data/`
(defined by `rock_data_dir`)

* Your hostname (FQDN) is defined in the `playbooks/inventory/all-in-one.ini` file

* You allow management via SSH from any network (defined by `rock_mgmt_nets`)

* You wish to use Zeek, Suricata, Stenographer (disabled by default) and the
whole data pipeline. (See `with_*` options)

* If installed via ISO, you will perform an offline install, else we assume
online (defined by `rock_online_install`)

* Zeek will use half of your CPU resources, up to 8 CPUs

We will continue to add more support information as the userbase grows.

## Deployment Script
If you find the deployment is failing, the script can be run with very verbose
output.  This example will write the output to a file for review:  

`DEBUG=1 ./deploy_rock.sh | tee /tmp/deploy_rock.log`


## Log Timestamps

UTC is generally preferred for logging data as the timestamps from anywhere in the world will have a proper order without calculating offsets. That said, Kibana will present the zeek logs according to your timezone (as set in the browser). The logs themselves (i.e. in /data/bro/logs/) log in epoch time and will be written in UTC regardless of the system timezone.

Zeek includes a utility for parsing these on the command line called `bro-cut`. It can be used to print human-readable timestamps in either the local sensor timezone or UTC. You can also give it a custom format string to specify what you'd like displayed.
