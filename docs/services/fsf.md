# FSF
[FSF](https://github.com/EmersonElectricCo/fsf) is included in RockNSM to
provide _**static**_ file analysis on filetypes of interest.


## Overview
FSF works in conjuction with the file extraction framework provided by [Bro](./bro.md).
Bro can be configured to watch for specific file (mime) types, as well as
establishing max file sizes that will be extracted.

FSF uses a client-server model and can watch for new extracted files in the
`/data/fsf/` partition.


## Management

### Services

FSF is deployed as a systemd unit, called **fsf**. Normal systemd procedures
apply here:

```
sudo systemctl start fsf
sudo systemctl status fsf
sudo systemctl stop fsf
sudo systemctl restart fsf
```

It can also be managed using the `rockctl` command.

## Directories

### Server

`/opt/fsf/fsf-server/conf/config.py` - main config file  
`/opt/fsf/fsf-server/main.py` - server script  

### Client

`/opt/fsf/fsf-client/conf/config.py` - main config file  
`/opt/fsf/fsf-client/fsf_client.py` - client binary  
