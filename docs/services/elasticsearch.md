# Elasticsearch

## Overview
Elasticsearch is the data storage and retrieval system in RockNSM. Elasticsearch
is an "indexed JSON document store".  Unlike other solutions, (network) events are
indexed **once** on initial ingest, and after which you can run queries and
aggregations quickly and efficiently.

ROCK sends all logs preformatted in JSON, complete with human readable timestamps.
This does two things:

1. Elasticsearch compression is effctively increased since there is not two
copies of the data, raw and JSON.  
1. The preformatted timestamps and JSON log data greatly increase the logging and
error rate while increasing reliability of the logging infrastructure.


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

### API Access

Elasticsearch data can be accessed via a [Restful API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs.html)
over port 9200. Kibana is the most common way this is done, but this can also be
accomplished with `curl` commands, such as: `$ curl <sensorip>:9200/_cat/indices`.  


## Directories

* home:
    * `/usr/share/elasticsearch`
* data:
    * `/data/elasticsearch/`
* application logs:
    * `/var/log/elasticsearch/`
