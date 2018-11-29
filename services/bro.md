# Bro

## Overview
Bro is used for full packet analysis within ROCK. It is extremely customizable, and it is encouraged that you take advantage of this.

When deploying custom Bro scripts, please be sure to store them under a subdirectory of `{{ bro_site_dir }}/scripts/`. We can't guarantee that your customizations won't be overwritten by Ansible if you don't follow this pattern.

## Management

### Service
Bro is deployed as a systemd unit, called **bro**. Normal systemd procedures apply here:

```
sudo systemctl start bro
sudo systemctl status bro
sudo systemctl stop bro
sudo systemctl restart bro
```

The `broctl` command is now an alias. Using this alias prevents dangerous permission changes caused by running the real broctl binary with sudo.  The only safe way otherwise to run `broctl` is to execute it as the `bro` user and `bro` group as such:

<!-- **Note:** Do not use broctl for management. This has the potential to cause a lot of heartburn with directory permissions if executed improperly. If you _must_ use `broctl`, be sure to execute it as the `bro` user and `bro` group. -->

```
sudo -u bro -g bro /usr/bin/broctl
```

### File System Paths

* Home
  * `/usr/share/bro/`
* Data
  * `/data/bro/logs/current/{stream_name.log}`
* Application Logs
  * `/data/bro/logs/current/{stdout.log, stderr.log}`

**Note:** By default, Bro will write ASCII logs to the data path above AND write JSON directly to Kafka. In general, you will be accessing the Bro data from [Elasticsearch](elasticsearch.md) via [Kibana](kibana.md).
