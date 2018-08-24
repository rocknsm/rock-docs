# ROCK Services

ROCK uses a suite of open-source applications as described in the **Components**
section of the [Overview](overview/index.md).

This portion of the guide covers basic administration of these services as it relates to ROCK.


* **[Bro](bro.md)**
* **[Elasticsearch](elasticsearch.md)**
* **[Filebeat](filebeat.md)**
* **[FSF](fsf.md)**
* **[Kafka](kafka.md)**
* **[Kibana](kibana.md)**
* **[Logstash](logstash.md)**
* **[Stenographer](stenographer.md)**
* **[Suricata](suricata.md)**

You can also use `rockctl` to manage full suite of installed services:

```
$ sudo rockctl status
ZOOKEEPER:
   Active: active (running) since Fri 2018-08-24 00:39:34 UTC; 6h agoi
KAFKA:
   Active: active (running) since Fri 2018-08-24 00:39:35 UTC; 6h agoi
BRO:
   Active: active (running) since Fri 2018-08-24 00:42:45 UTC; 6h agoi
SURICATA:
   Active: active (running) since Fri 2018-08-24 00:41:54 UTC; 6h agoi
FILEBEAT:
   Active: active (running) since Fri 2018-08-24 00:42:46 UTC; 6h agoi
ELASTICSEARCH:
   Active: active (running) since Fri 2018-08-24 00:39:40 UTC; 6h agoi
LOGSTASH:
   Active: active (running) since Fri 2018-08-24 00:42:46 UTC; 6h agoi
KIBANA:
   Active: active (running) since Fri 2018-08-24 00:40:01 UTC; 6h agoi
STENOGRAPHER:
   Active: active (exited) since Fri 2018-08-24 06:50:35 UTC; 9s agoi
STENOGRAPHER@ENP0S8:
   Active: active (running) since Fri 2018-08-24 06:50:35 UTC; 9s agoi
```
