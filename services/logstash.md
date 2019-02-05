# Logstash

[Logstash](https://www.elastic.co/guide/en/logstash/current/getting-started-with-logstash.html) is part of the Elastic Stack that performs log file filtering and
enrichment.


<!-- ## Overview

...


## Basic Usage

... -->
## Management

#### Services

Logstash is deployed as a systemd unit, called **logstash**. Normal systemd
procedures apply here:

```
sudo systemctl start logstash
sudo systemctl status logstash
sudo systemctl stop logstash
sudo systemctl restart logstash
```

It can also be managed using the [rockctl](../operate/index.md) command.

#### Directories

`/etc/logstash/` - main config path  

`/etc/logstash/conf.d` - ROCK specific config  

`/var/lib/logstash` - data path  


---

Continue to [Stenographer](./stenographer.md)
