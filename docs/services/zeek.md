# Zeek

> Note: While "Zeek" is the new name of the project, directories,
service files, and binaries still (for now) retain the "bro" name.  

## Overview
Zeek (the artist formerly known as Bro) is used to provide network protocol analysis within ROCK. It is extremely
customizable, and it is encouraged that you take advantage of this.

When deploying custom Zeek scripts, please be sure to store them under a
subdirectory of `/usr/share/bro/site/scripts/`. We can't guarantee that your
customizations won't be overwritten by Ansible if you don't follow this pattern.

## Management

### Service
Zeek is deployed as a systemd unit, called `bro.service`. Normal systemd procedures
apply here:

```
sudo systemctl start bro
sudo systemctl status bro
sudo systemctl stop bro
sudo systemctl restart bro
```

The `broctl` command is now an alias. Using this alias prevents dangerous
permission changes caused by running the real broctl binary with sudo.  The only
safe way otherwise to run `broctl` is to execute it as the `bro` user and `bro`
group as such:  

`sudo -u bro -g bro /usr/bin/broctl`

## Directories

* Home
    * `/usr/share/bro/`
* Data
    * `/data/bro/logs/current/{stream_name.log}`
* Application Logs
    * `/data/bro/logs/current/{stdout.log, stderr.log}`

<br>
**Note:** By default, Zeek will write ASCII logs to the data path above AND write
 JSON directly to Kafka. In general, you will be accessing the Bro data from
 [Elasticsearch](elasticsearch.md) via [Kibana](kibana.md).  
