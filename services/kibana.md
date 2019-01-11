# Kibana

## Overview
Kibana is what we use as a graphical interface for retrieving data from
[Elasticseach](elasticsearch.md).

## Basic Usage
Once Kibana is running, open a web browser and enter

Kibana is available by pointing your browser to `https://<MGMT-IP>/`

Credentials will be in the home directory of the user after ROCK configuration.

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

### File System Paths

* Home
  * `/usr/share/kibana`
* Data
  * Stored in **.kibana** index in [Elasticseach](elasticsearch.md)
* Application Logs
  * `journalctl -u kibana`
