# Usage
<!-- Derek Ditch <derek@rocknsm.io>; Jeff Geiger <jeff@rocknsm.io>
:icons: font
:experimental: -->

## Start / Stop / Status
Accomplished with `rock_stop`, `rock_start`, and `rock_status`.

TIP: These may need to be prefaced with /usr/local/bin/ depending on your PATH.

`sudo rock_stop`

```
[root@simplerockbuild ~]# rock_stop
Stopping Bro...
stopping worker-1-1 ...
stopping worker-1-2 ...
stopping proxy-1 ...
stopping manager ...
Stopping Logstash...
Stopping Kibana...
Stopping Elasticsearch...
Stopping Kafka...
Stopping Zookeeper...
```

`sudo rock_start`
```
[root@simplerockbuild ~]# rock_start
Starting Zookeeper...
Active: active (running) since Wed 2015-12-02 17:12:02 UTC; 5s ago
Starting Elasticsearch...
Active: active (running) since Wed 2015-12-02 17:12:07 UTC; 5s ago
Starting Kafka...
Active: active (running) since Wed 2015-12-02 17:12:12 UTC; 5s ago
Starting Logstash...
Active: active (running) since Wed 2015-12-02 17:12:17 UTC; 5s ago
Starting Kibana...
Active: active (running) since Wed 2015-12-02 17:12:22 UTC; 5s ago
Starting Bro...
removing old policies in /data/bro/spool/installed-scripts-do-not-touch/site ...
removing old policies in /data/bro/spool/installed-scripts-do-not-touch/auto ...
creating policy directories ...
installing site policies ...
generating cluster-layout.bro ...
generating local-networks.bro ...
generating broctl-config.bro ...
generating broctl-config.sh ...
updating nodes ...
manager scripts are ok.
proxy-1 scripts are ok.
worker-1-1 scripts are ok.
worker-1-2 scripts are ok.
starting manager ...
starting proxy-1 ...
starting worker-1-1 ...
starting worker-1-2 ...
Getting process status ...
Getting peer status ...
Name Type Host Status Pid Peers Started
manager manager localhost running 20389 ??? 02 Dec 17:12:34
proxy-1 proxy localhost running 20438 ??? 02 Dec 17:12:35
worker-1-1 worker localhost running 20484 ??? 02 Dec 17:12:36
worker-1-2 worker localhost running 20485 ??? 02 Dec 17:12:36
```

`sudo rock_status`
```
[root@simplerockbuild ~]# /usr/local/bin/rock_status
✓ Check each monitor interface is live
✓ Check for interface errors
✓ Check monitor interface for tx packets
✓ Check PF_RING settings
✓ Check that broctl is running
✓ Check for bro-detected packet loss
✓ Check that zookeeper is running
✓ Check that zookeeper is listening
✓ Check that client can connect to zookeeper
✓ Check that kafka is running
✓ Check that kafka is connected to zookeeper
✓ Check that logstash is running
✓ Check that elasticsearch is running
✓ Check that kibana is running

14 tests, 0 failures
```

## Basic Troubleshooting

### Functions Check:
```
# After the initial build, the ES cluster will be yellow because the marvel index will think it's missing a replica. Run this to fix this issue. This job will run from cron just after midnight every day.
/usr/local/bin/es_cleanup.sh 2>&1 > /dev/null

# Check to see that the ES cluster says it's green:
curl -s localhost:9200/_cluster/health | jq '.'

# See how many documents are in the indexes. The count should be non-zero.
curl -s localhost:9200/_all/_count | jq '.'

# You can fire some traffic across the sensor at this point to see if it's collecting.
# NOTE: This requires that you upload your own test PCAP to the box.
sudo tcpreplay -i [your monitor interface] /path/to/a/test.pcap

# After replaying some traffic, or just waiting a bit, the count should be going up.
curl -s localhost:9200/_all/_count | jq '.'

# You should have plain text bro logs showing up in /data/bro/logs/current/:
ls -ltr /data/bro/logs/current/

# Kafkacat is your kafka swiss army knife. This command will consume the current queue. You should see a non-zero offset.
kafkacat -C -b localhost -t bro_raw -e | wc -l

# If you haven't loaded kibana already, it should be running on port 5601. This just verifies while you're still on the command line.
sudo netstat -planet | grep node
```

### Key web interfaces:
IPADDRESS = The management interface of the box, or "localhost" if you did the vagrant build.

http://IPADDRESS - Kibana

### Log Timestamps

This section needs more massagery...

```
UTC is generally preferred for logging data as the timestamps from anywhere in the world will have a proper order without calculating offsets. That said, Kibana will present the bro logs according to your timezone (as set in the browser). The bro logs themselves (i.e. in /data/bro/logs/) log in epoch time and will be written in UTC regardless of the system timezone. Bro includes a utility for parsing these on the command line called bro-cut. It can be used to print human-readable timestamps in either the local sensor timezone or UTC. You can also give it a custom strftime format string to specify what you'd like displayed.
```

## Known Issues

There's some listed on GitHub.

. Best practice custom partitioning?
. Insufficient documentation
. Still doing integration work with FSF
. Still working on some additional health checks
. What have you found???

## Examples

### Topology
* monodraw diagram *TBD*

### Places to get PCAP
* list of exercises / training sources *TBD*

### Bro Replay
* `bro-r` examples *TBD*

### ROCK @ Home
* examples of home implementation *TBD*
