# Kafka
[Kafka](https://kafka.apache.org/documentation/) is a wicked fast and reliable
message queue.


## Overview
Kafka solves the problem of having multiple data sources sending into the same
pipeline. It acts as a staging area to allow [Logstash](./Logstash) to keep up
with things.

<!-- ## Basic Usage

... -->

## Management

#### Services
Kafka is deployed as a systemd unit, called **kafka**. Normal systemd
procedures apply here:

```
sudo systemctl start kafka
sudo systemctl status kafka
sudo systemctl stop kafka
sudo systemctl restart kafka
```

It can also be managed using the `rockctl` command.


## Directories

`etc/kafka/server.properties` - primary config file  
