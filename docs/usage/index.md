# Basic Usage

## Key Interfaces

### Kibana - `https://localhost`

The generated credentials are in the home directory of the user created at install:  
<br>
`~/KIBANA_CREDS.README`  

### Docket - `https://localhost/app/docket/`

Docket - web interface for pulling PCAP from the sensor (must be enabled in config)  
<br>
> localhost **or** IP of the management interface of the box  


## Functions Checks


### Cluster Health
Check to see that the ES cluster says it's green:
```
curl -s localhost:9200/_cluster/health?pretty  
```

### Document Check
See how many documents are in the indexes. The count should be non-zero:
```
curl -s localhost:9200/_all/_count?pretty  
```

### Testing with PCAP
You can fire some traffic across the sensor at this point to see if it's
collecting. This requires that you upload your own test PCAP to the box. PCAP is
typically huge, so if you don't have any just lying around, here's a quick test:  

- Download a small test file from the folks who brought us `tcpreplay`
[here](http://tcpreplay.appneta.com/wiki/captures.html):  
```
curl -LO https://s3.amazonaws.com/tcpreplay-pcap-files/smallFlows.pcap
```
- Replay the PCAP file across your _monitor interface_:  
```
sudo tcpreplay -i [your-monitor-interface] /path/to/smallflow.pcap  
```

- After a few moments, the document count should go up. This can again be
validated with:
```
curl -s localhost:9200/_all/_count?pretty
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
