# Usage Guide

### Key web interfaces

https://localhost - Kibana web interface - After deploy, the created creds are in the home directory of the user created upon install as `KIBANA_CREDS.README`<br />  

https://localhost:8443 - Docket - web interface for pulling PCAP from the sensor (must be enabled in config)

> localhost = IP of the management interface of the box  

<!-- TODO add image -->

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

You should have plain text bro logs showing up in /data/bro/logsM/current/:

- `ls -ltr /data/bro/logs/current/`


## Start / Stop / Status

@todo Modify the `rock_*` tasks to be `rockctl {start|stop|status}`
They're still there, for now, but `rockctl` is the "One True Path":tm:.


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
