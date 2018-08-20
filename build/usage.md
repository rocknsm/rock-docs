# Usage Guide

## Functions Checks

After the initial build, the ES cluster will be yellow because the marvel index will think it's missing a replica. Run this to fix this issue. This job will run from cron just after midnight every day:

- `/usr/local/bin/es_cleanup.sh 2>&1 > /dev/null`

Check to see that the ES cluster says it's green:

- `curl -s localhost:9200/_cluster/health | jq '.'`

See how many documents are in the indexes. The count should be non-zero:

- `curl -s localhost:9200/_all/_count | jq '.'`

You can fire some traffic across the sensor at this point to see if it's collecting. NOTE: This requires that you upload your own test PCAP to the box.

- `sudo tcpreplay -i [your monitor interface] /path/to/a/test.pcap`

After replaying some traffic, or just waiting a bit, the count should be going up.

- `curl -s localhost:9200/_all/_count | jq '.'`

You should have plain text bro logs showing up in /data/bro/logs/current/:

- `ls -ltr /data/bro/logs/current/`


## Start / Stop / Status
These functions are accomplished with `rock_stop`, `rock_start`, and `rock_status`.

> NOTE: these may need to be prefaced with /usr/local/bin/ depending on your _$PATH_.

* `sudo rock_start`

<p align="center">
<a href="https://asciinema.org/a/QAxK2iiWEw2bFRKUc5JFri3n9" target="_blank"><img src="https://asciinema.org/a/QAxK2iiWEw2bFRKUc5JFri3n9.png" width="469"/></a>
</p>

* `sudo rock_status`

<p align="center">
<a href="https://asciinema.org/a/z9qgFqFTr9HoeSMpX2gKWXqng" target="_blank"><img src="https://asciinema.org/a/z9qgFqFTr9HoeSMpX2gKWXqng.png" width="469"/></a>
</p>

* `sudo rock_stop`

<p align="center">
<a href="https://asciinema.org/a/ME56ahRQrj3qmrynGzCc47GyM" target="_blank"><img src="https://asciinema.org/a/ME56ahRQrj3qmrynGzCc47GyM.png" width="469"/></a>
</p>


### Key web interfaces

https://localhost - Kibana web interface - After deploy, the created creds are in the home directory of the user created upon install as `KIBANA_CREDS.README`<br />
https://localhost:8443 - Docker - (If enabled) The web interface for pulling PCAP from the sensor

> localhost = IP of the management interface of the box


### Log Timestamps

UTC is generally preferred for logging data as the timestamps from anywhere in the world will have a proper order without calculating offsets. That said, Kibana will present the bro logs according to your timezone (as set in the browser). The bro logs themselves (i.e. in /data/bro/logs/) log in epoch time and will be written in UTC regardless of the system timezone.

Bro includes a utility for parsing these on the command line called `bro-cut`. It can be used to print human-readable timestamps in either the local sensor timezone or UTC. You can also give it a custom format string to specify what you'd like displayed.
