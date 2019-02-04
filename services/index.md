# ROCK Services

ROCK uses a suite of open-source applications as described in the **Components**
section of the [Overview](overview/index.md). This portion of the guide covers
basic administration of these services that are part of RockNSM.


### Published URLs

ROCK uses the `lighttpd` webserver to perform vhost redirects to it's web
interfaces. It's configured to listen for (IPV4 only) connections over
port `443` for the following:  

* [Kibana](kibana.md) is accessible at: `https://<sensorip>/app/kibana`  

* [Docket](docket.md) is accessible at: `https://<sensorip>/app/docket/`  


### Managing Services

If you're generally familiar with systemd you'll know that the command used to
manage services on modern systems is `systemctl`. With ROCK we've provided a
wrapper to control services called `rockctl`. Rockctl can be used to perform the
following operations:

```perl
$ sudo rockctl  status          # display status of ROCK services
                start           # start all ROCK services
                stop            # stop all ROCK services
                reset-failed    # clear the failed states of services
```

Here is an example output of `rockctl status`:  

```
[admin@rock ~]# sudo rockctl status


ZOOKEEPER:
   Active: active (running) since Mon 2019-01-28 21:35:55 UTC; 1 weeks 0 days ago
KAFKA:
   Active: active (running) since Mon 2019-01-28 21:35:55 UTC; 1 weeks 0 days ago
BRO:
   Active: active (running) since Mon 2019-01-28 21:44:36 UTC; 1 weeks 0 days ago
SURICATA:
   Active: active (running) since Mon 2019-01-28 21:40:21 UTC; 1 weeks 0 days ago
FILEBEAT:
   Active: active (running) since Mon 2019-01-28 21:36:26 UTC; 1 weeks 0 days ago
ELASTICSEARCH:
   Active: active (running) since Mon 2019-01-28 21:35:57 UTC; 1 weeks 0 days ago
LOGSTASH:
   Active: active (running) since Mon 2019-01-28 21:36:26 UTC; 1 weeks 0 days ago
KIBANA:
   Active: active (running) since Mon 2019-01-28 21:36:10 UTC; 1 weeks 0 days ago
STENOGRAPHER:
   Active: active (exited) since Mon 2019-01-28 22:51:47 UTC; 1 weeks 0 days ago
STENOGRAPHER@EM1:
   Active: active (running) since Mon 2019-01-28 22:51:47 UTC; 1 weeks 0 days ago
```


### Services Index

See the following list for more details on the operation and configuration of
ROCK services:  

* [Bro](bro.md)
* [Docket](docket.md)
* [Elasticsearch](elasticsearch.md)
* [Filebeat](filebeat.md)
* [FSF](fsf.md)
* [Kafka](kafka.md)
* [Kibana](kibana.md)
* [Logstash](logstash.md)
* [Stenographer](stenographer.md)
* [Suricata](suricata.md)

You can also use `rockctl` to manage full suite of installed services:
