# Elasticsearch

## Overview
Elasticsearch is our data storage and retrieval system. Events are stored as JSON within Elasticsearch, where you can run queries and aggregations against them.

ROCK sends all logs preformatted in JSON, complete with human readable timestamps. This does two things. First, Elasticsearch compression is effctively increased since there is not two copies of the data, raw and JSON.  The preformatted timestamps and JSON log data greatly increase the logging and error rate while increasing reliability of the logging infrastructure. 

## Management

### Service
Elasticsearch is deployed as a systemd unit, called **elasticsearch**. Normal
systemd procedures apply here:

```
sudo systemctl start elasticsearch
sudo systemctl status elasticsearch
sudo systemctl stop elasticsearch
sudo systemctl restart elasticsearch
```

### File System Paths

* Home
  * `/usr/share/elasticsearch`
* Data
  * `/data/elasticsearch/`
* Application Logs
  * `/var/log/elasticsearch/`
