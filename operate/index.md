# ROCK Operation

## Functions Checks

To verify that you're collecting on the right interface:
```
less /etc/suricata/rocknsm-overrides.yaml
...
af-packet:
  - interface: <capture interface>
...
```

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

@todo Modify the `rock_*` tasks to be `rockctl {start|stop|status}`
They're still there, for now, but `rockctl` is the "One True Path":tm:.


These functions are accomplished with `rock_stop`, `rock_start`, and `rock_status`.

> NOTE: these may need to be prefaced with /usr/local/bin/ depending on your _$PATH_.

* `sudo rock_start`

<p align="center">
<a href="https://asciinema.org/a/QAxK2iiWEw2bFRKUc5JFri3n9"><img src="https://asciinema.org/a/QAxK2iiWEw2bFRKUc5JFri3n9.png" width="469"/></a>
</p>

* `sudo rock_status`

<p align="center">
<a href="https://asciinema.org/a/z9qgFqFTr9HoeSMpX2gKWXqng"><img src="https://asciinema.org/a/z9qgFqFTr9HoeSMpX2gKWXqng.png" width="469"/></a>
</p>

* `sudo rock_stop`

<p align="center">
<a href="https://asciinema.org/a/ME56ahRQrj3qmrynGzCc47GyM"><img src="https://asciinema.org/a/ME56ahRQrj3qmrynGzCc47GyM.png" width="469"/></a>
</p>


### Configuring Bro
`/etc/bro/networks.cfg` is where you will verify the correct networks are listed for Bro. If you are monitoring networks not listed, or would like to carve them up differently, you can do that here as well.
```
sudo vi /etc/bro/networks.cfg
#LOCAL NETS
10.0.0.0/8      RFC1918
172.16.0.0/12   RFC1918
192.168.0.0/16  RFC1918

##########
## ROCK ##
##########
# Add networks for the networks you are monitoring into this file if they're not RFC1918
##########
```

### Configuring Suricata
`/etc/suricata/suricata.yml` is where you will verify the correct networks are listed for Suricata. You'll do this on the `HOME_NET` line.
```
sudo vi /etc/suricata/suricata.yml
...
HOME_NET: "[192.168.0.0/16,10.0.0.0/8,172.16.0.0/12]"
...
```
Likely, you're going to want to make sure that Bro and Suricata are looking at the same networks, so if you made a change when configuring Bro (`/etc/bro/networks.cfg`), you'll want to ensure that you mirror those changes here.

### Configuring Stenographer
`/etc/stenographer/config` is where you're configure Stenographer for packet capture. Likely, you'll need to update this with `/etc/stenographer/config.<interface_name>`:
```
cat /etc/stenographer/config
# if this is not the correct interface, you can simply update it
sudo cp /etc/stenographer/config.<interface_name> /etc/stenographer/config
```

### Key web interfaces

https://localhost - Kibana web interface - After deploy, the created creds are in the home directory of the user created upon install as `KIBANA_CREDS.README`<br />
https://localhost:8443 - Docket - (If enabled) The web interface for pulling PCAP from the sensor

> localhost = IP of the management interface of the box

### Log Timestamps

UTC is generally preferred for logging data as the timestamps from anywhere in the world will have a proper order without calculating offsets. That said, Kibana will present the bro logs according to your timezone (as set in the browser). The bro logs themselves (i.e. in /data/bro/logs/) log in epoch time and will be written in UTC regardless of the system timezone.

Bro includes a utility for parsing these on the command line called `bro-cut`. It can be used to print human-readable timestamps in either the local sensor timezone or UTC. You can also give it a custom format string to specify what you'd like displayed.
