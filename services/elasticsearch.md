# Elasticsearch

## Overview
Elasticsearch is our data storage and retrieval system. Events are stored as JSON
within Elasticsearch, where you can run queries and aggregations against them.

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

* Data
  * `/data/elasticsearch/`
* Application Logs
  * `/var/log/elasticsearch/`
