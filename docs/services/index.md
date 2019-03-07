# Summary

ROCK uses a collection of open-source applications as described in this Services
section. This portion of the guide covers basic administration of each part of
RockNSM.


## Published URLs and Ports

ROCK uses the `lighttpd` webserver to perform vhost redirects to it's web
interfaces. It's configured to listen for (IPV4 only) connections over
port `443` for the following:  

### URLs

* [Kibana](kibana.md) is accessible at: `https://<sensorip>/app/kibana`  
* [Docket](docket.md) is accessible at: `https://<sensorip>/app/docket/`  


### Ports

* Elasticsearch: `:9200`
* Kibana: `:5601`


## Rockctl

If you're generally familiar with systemd you'll know that the command used to
manage services on modern systems is `systemctl`.  

With ROCK we've provided a wrapper to control services called `rockctl`. Rockctl
can be used to perform the following operations:  

```shell
$ sudo rockctl  status          # display status of ROCK services
                start           # start all ROCK services
                stop            # stop all ROCK services
                reset-failed    # clear the failed states of services
```

Here is an example output of `rockctl status`:  

```shell
[admin@rock ~]$ sudo rockctl status

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
