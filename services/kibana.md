# Kibana

## Overview
Kibana is what we use as a graphical interface for retrieving data from
[Elasticseach](elasticsearch.md).

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
