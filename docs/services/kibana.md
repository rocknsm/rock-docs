# Kibana

## Overview
Kibana is the web interface used to display data inside [Elasticseach](elasticsearch.md).


## Basic Usage

Open a web browser and visit the following url: `https://<sensorip>/app/kibana`.

On first connection, users will be prompted for a username and password. Upon
running the deploy script a random passphrase is generated in the style of [XKCD](https://xkcd.com/936/).

These credentials are stored in "KIBANA_CREDS.README" file located in the home directory of the user
created at install e.g. `/home/admin/KIBANA_CREDS.README`.

## Management

### Service

Kibana is deployed as a systemd unit, called **kibana**. Normal
systemd procedures apply here:

```
sudo systemctl start kibana
sudo systemctl status kibana
sudo systemctl stop kibana
sudo systemctl restart kibana
```

## Directories

* Home:  
`/usr/share/kibana`  
* Data:  
Stored in `.kibana` index in [Elasticseach](elasticsearch.md)  
* Application Logs:  
`journalctl -u kibana`  
