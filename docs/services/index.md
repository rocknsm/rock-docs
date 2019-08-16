# Summary

ROCK uses a collection of open-source applications as described in this
"Services" section. This portion of the documentation covers the basic
administration of each of the major components of RockNSM.  


## Managing All Services

If you know Linux operating systems that use systemd, the you'll be familiar
with the command `systemctl` to manage services. ROCK provides two separate
scripts that provide similar functionality, depending upon your deployment
scenario.  

1. $ `rockctl` - service manage for a **single-node** instance

1. $ `rock` - service manage for a **multi-node** instance


### rockctl

The `rockctl` command is a Bash script that calls systemd to action all
ROCK services. Use this tool when you're connected to a specific sensor and
need to take action on the sensor services as a group. `rockctl` can be used
to perform the following operations:  

```shell
$ sudo rockctl  status          # Report status for all ROCK services on this host
                stop            # Stop all ROCK services on this host
                start           # Start all ROCK services on this host
                restart         # Restart all ROCK services on this host
                reset-failed    # Reset failed status all ROCK services on this host
                                # Useful for services like stenographer that start and exit
```


### rock

The `rock` command is a Bash script that uses Ansible to action services across
all sensors across all sensors that are part of a multi-node deployment.  

```shell
[admin@rock ~]$ rock

Commands:
setup               Launch TUI to configure this host for deployment
tui                 Alias for setup
ssh-config          Configure hosts in inventory to use key-based auth (multinode)
deploy              Deploy selected ROCK components
deploy-offline      Same as deploy --offline (Default ISO behavior)
deploy-online       Same as deploy --online
stop                Stop all ROCK services
start               Start all ROCK services
restart             Restart all ROCK services
status              Report status for all ROCK services
genconfig           Generate default configuration based on current system
destroy             Destroy all ROCK data: indexes, logs, PCAP, i.e. EVERYTHING
                      NOTE: Will not remove any services, just the data

Options:
--config, -c <config_yaml>         Specify full path to configuration overrides
--extra, -e <ansible variables>    Set additional variables as key=value or YAML/JSON passed to ansible-playbook
--help, -h                         Show this usage information
--inventory, -i <inventory_path>   Specify path to Ansible inventory file
--limit <host>                     Specify host to run plays
--list-hosts                       Outputs a list of matching hosts; does not execute anything else
--list-tags                        List all available tags
--list-tasks                       List all tasks that would be executed
--offline, -o                      Deploy ROCK using only local repos (Default ISO behavior)
--online, -O                       Deploy ROCK using online repos
--playbook, -p <playbook_path>     Specify path to Ansible playbook file
--skip-tags <tags>                 Only run plays and tasks whose tags do not match these values
--tags, -t <tags>                  Only run plays and tasks tagged with these values
--verbose, -v                      Increase verbosity of ansible-playbook
```


## Managing Single Services

When you need to take action on a singular service (a la carte), use `systemctl`
 as you would


## Published URLs and Ports

ROCK uses the `lighttpd` webserver to perform vhost redirects to it's web
interfaces. It's configured to listen for (IPV4 only) connections over
port `443` for the following:  

### URLs

- [Kibana](kibana.md) is accessible at: `https://<sensorip>/app/kibana`  
- [Docket](docket.md) is accessible at: `https://<sensorip>/app/docket/`  


### Ports

* Elasticsearch: `:9200`
* Kibana: `:5601`
