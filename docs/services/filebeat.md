# Filebeat

<p align="center">
<img src="../../img/filebeat-pipeline.png">
</p>


## Overview

[Elastic Beats](https://www.elastic.co/products/beats) are lightweight
"data shippers". Filebeat's role in ROCK is to do just this: ship file data to
the next step in the pipeline.

The following ROCK components depend on Filebeat to send their log files into
the Kafka message queue:  

1. **Suricata** - writes alerting data into `eve.json`  

2. **FSF** - writes static file scan results to `rockout.log`  


## Management

#### Service

The filebeat service is configured and enabled on startup.  This can be verified
with either:  

`$ sudo rockctl status`  

`$ sudo systemctl status filebeat`  


## Directories

The configuration path for Filebeat is found at:  

`/etc/filebeat/filebeat.yml`
