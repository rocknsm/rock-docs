One of the new features in version 2.4 is the Rock Manager. This script provides
a one stop shop for managing all things ROCK.

To display all available commands and options run:  $`rock`

```
Usage: /usr/sbin/rock COMMAND [options]
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
<br>
As you can see above, the `rock` command has many options available, so here's a
basic breakdown of how you would use this command:  


## Initial Deployment
```shell
sudo rock setup            # launches interface to configure settings  
sudo rock ssh-setup        # configures ssh access to rock nodes (multinode)
sudo rock deploy-offline   # deploys ROCK using local pre-staged packages  
sudo rock deploy-online    # deploys ROCK using online repo packages  
```
<br>
> Stand by for a detailed walkthrough of the initial deployment process in the
"Deploy" section coming up.


## Basic Usage
```shell
sudo rock status          # display status of all ROCK services
sudo rock stop            # stop all ROCK services
sudo rock start           # start all ROCK services
sudo rock restart         # restart all ROCK services
```

## Advanced Usage
```shell
sudo rock genconfig       # regenerate a fresh config.yml file
sudo rock destroy         # removes ALL sensor data (logs, indices, PCAP)
```
<br>
<br>
