# Stenographer

ROCK uses [Stenographer](https://github.com/google/stenographer) for full packet
capture. Among other features, it provides the following advantages over other
solutions:

* it's fast
* manages disk space
    * will fill it's disk partition to 90%
    * then start to overwrite oldest data forward  

## Management

### Systemd
Stenographer is deployed as a systemd unit, called **stenographer**. Normal
systemd procedures apply here:  

```shell
sudo systemctl start stenographer
sudo systemctl status stenographer
sudo systemctl stop stenographer
sudo systemctl restart stenographer
```

### Rockctl
It can also be managed using the `rockctl` command.  


### Multiple Interfaces

It's important to note that Stenographer will have a (main) parent process, and
a child process for every interface that it uses to capture packets. ex:  
```shell
STENOGRAPHER:
   Active: active (exited) since Mon 2019-01-28 22:51:47 UTC; 1 weeks 0 days ago
STENOGRAPHER@EM1:
   Active: active (running) since Mon 2019-01-28 22:51:47 UTC; 1 weeks 0 days ago
```

In order to restart all Stenographer processes, a wildcard can be used:  
    `sudo sytemctl restart stenographer*`  


## Directories

Stenographer is great at managing it's own disk space, but that doesn't cut it
when it's sharing the same mount point as Bro, Suricata , and other tools that
generate data in ROCK.

Best practice would be to create a `/data/stenographer` partition in order to
prevent limited operations.
