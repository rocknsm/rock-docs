# Stenographer

ROCK uses [Stenographer] for full packet capture.


## Overview

Among other features, Steno provides the following advantages over other
solutions:

* it's fast
* manages disk space - will fill it's disk to 90% and then start to overwrite
the oldest data forward  

<!-- ## Basic Usage

... -->

## Management

#### Services

Suricata is deployed as a systemd unit, called **stenographer**. Normal systemd
procedures apply here:

```
sudo systemctl start stenographer
sudo systemctl status stenographer
sudo systemctl stop stenographer
sudo systemctl restart stenographer
```

It can also be managed using the [rockctl](../operate/index.md) command.



> Stenographer will have a child process for every interface that it uses to
capture packets. The more interfaces for collection, there will be an entry in
`rockctl` for each.  


#### Directories

Stenographer is great at managing it's own disk space, but that doesn't cut it when it's sharing the same mount point as Bro, Suricata , and other tools that generate data in ROCK.

Best practice would be to create a `/data/stenographer` partition in order to prevent limited operations.


---

Continue to [Suricata](./suricata.md)
