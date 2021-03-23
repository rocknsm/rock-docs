# Basic Usage

## Key Interfaces

### Kibana - `https://localhost`

---
:warning: We are aware of an issue with macOS Catalina and the most current version of Chrome browser that prevents Chrome from allowing self-signed TLS certificates. We are looking for an answer and will update when we find that. This does not affect Safari or Firefox or other operating systems.

As a workaround, you can [manually add and Always Trust](https://support.apple.com/guide/keychain-access/change-the-trust-settings-of-a-certificate-kyca11871/mac) the RockNSM TLS certificate to your macOS keychain via Keychain Access and restart Chrome.

---

The generated credentials are in the home directory of the user created at install:
<br>
`~/KIBANA_CREDS.README`

### Docket - `https://localhost/app/docket/`

Docket - web interface for pulling PCAP from the sensor (must be enabled in config)
<br>
> localhost **or** IP of the management interface of the box

## Update Suricata
Updating the IDS rules is paramount.

We'll use `suricata-update`, which is bundled with Suricata that takes a bunch of rule files and merges them into one rule that is stored in `/var/lib/suricata/rules/suricata.rules`.

### Online Sensor
```
sudo -u suricata suricata-update
```

### Offline Sensor
Since the sensor is offline, we can't use `suricata-update` to download the rules for us, so we'll download the most recent Emerging Threats rules and update locally.

From a system that has Internet access
```
curl -fsSLO https://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz
scp emerging.rules.tar.gz user@sensorIP:
```
Now connect to the sensors and update locally.
```
ssh user@sensorIP
tar zxf emerging.rules.tar.gz
sudo suricata-update --local rules/
rm -r rules emerging.rules.tar.gz
```

## Functions Checks


### Cluster Health
Check to see that the ES cluster says it's green:
```
curl -fsS localhost:9200/_cluster/health?pretty
```

### Document Check
See how many documents are in the indexes. The count should be non-zero:
```
curl -fsS localhost:9200/_all/_count?pretty
```

### Testing with PCAP
You can fire some traffic across the sensor at this point to see if it's
collecting. This requires that you upload your own test PCAP to the box. PCAP is
typically huge, so if you don't have any just lying around, here's a quick test:

- Download a small test file from the folks who brought us `tcpreplay`
[here](http://tcpreplay.appneta.com/wiki/captures.html):
```
curl -fsSLO https://s3.amazonaws.com/tcpreplay-pcap-files/smallFlows.pcap
```
- Replay the PCAP file across your _monitor interface_:
```
sudo tcpreplay -i [your-monitor-interface] /path/to/smallflow.pcap
```

- After a few moments, the document count should go up. This can again be
validated with:
```
curl -fsS localhost:9200/_all/_count?pretty
```
- You should have plain text bro logs showing up in /data/bro/logs/current/:
```
ls -ltr /data/bro/logs/current/
```


## Rockctl

The basic service management functions are accomplished with:

`sudo rockctl status` - get the status of ROCK services

<!-- <p align="center">
<a href="https://asciinema.org/a/z9qgFqFTr9HoeSMpX2gKWXqng" target="\_blank"><img src="https://asciinema.org/a/z9qgFqFTr9HoeSMpX2gKWXqng.png" width="469"/></a>
</p> -->

`sudo rockctl start` - start ROCK services

<!-- <p align="center">
<a href="https://asciinema.org/a/QAxK2iiWEw2bFRKUc5JFri3n9" target="\_blank"><img src="https://asciinema.org/a/QAxK2iiWEw2bFRKUc5JFri3n9.png" width="469"/></a>
</p> -->

`sudo rockctl stop` - stop ROCK services

<!-- <p align="center">
<a href="https://asciinema.org/a/ME56ahRQrj3qmrynGzCc47GyM" target="\_blank"><img src="https://asciinema.org/a/ME56ahRQrj3qmrynGzCc47GyM.png" width="469"/></a>
</p> -->

`sudo rockctl reset-failed` - clear the failed states of services
