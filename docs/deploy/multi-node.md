Now let's look at how to perform a ROCK deployment across multiple sensors.
This is where we can break out server roles for more complex and distributed
environment.

## Assumptions

This document assumes that you have done a fresh installation of ROCK on **all**
ROCK nodes using the [latest ISO](https://mirror.rocknsm.io/isos/stable/).  

1. 3 (minimum) sensors
1. sensors on same network, able to communicate
1. in this demo there are 3 newly installed ROCK sensors:  
    * `rock01.rock.lan - 172.16.1.23X`  
    * `rock02.rock.lan - 172.16.1.23X`  
    * `rock03.rock.lan - 172.16.1.23X`  
1. `admin` account created at install (same username for all nodes)


## Multi-node Configuration

### Designate Deployment Manager

First and foremost, one sensor will need to be designated as the "Deployment
Manager" (referred to as "DM" for the rest of this guide). This is a notional
designation to keep the process clean and as simple as possible. For our lab we
will use `rock01` as the DM.

> NOTE: all following commands will be run from your Deployment Manager (DM) box

Confirm that you can remotely connect to the DM:  
`ssh admin@<DM-ip>`  

Confirm that you can ping all other rock hosts.  For this example:  
`ping 172.16.1.236  #localhost`  
`ping 172.16.1.237`  
`ping 172.16.1.239`  


### Edit Inventory File

A deployment is performed using an Ansible playbooks, and target systems are defined
in an Ansible [inventory file](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html). In ROCK this file is located at `/etc/rocknsm/hosts.ini`.

We need to add additional ROCK sensors to the following sections of the
inventory file:  

* [rock]
* [web]
* [zookeeper]
* [es_masters]
* [es_data]
* [es_ingest]


#### [rock]

This group defines what nodes will be running ROCK services.

example:  
```yml
[rock]
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239
```


#### [web]

This group defines what node will be running web services.

example:  
```yml
[web]
rock03.rock.lan ansible_host=172.16.1.239
```


#### [zookeeper]

This group defines what node(s) will be running zookeeper.

example:  

```yml
[zookeeper]
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
```


#### [es_masters]

This group defines what node(s) will be running Elasticsearch, acting as
master nodes.

example:  

```yml
[es_masters]
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239
```


#### [es_data]

This group defines what node(s) will be running Elasticsearch, acting as
data nodes.

example:  

```yml
[es_data]
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239
```


#### [es_ingest]

This group defines what node(s) will be running Elasticsearch, acting as
ingest nodes.

example:  

```yml
[es_ingest]
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239
```


#### Example Inventory

Above, we broke out every section. Let's take a look at a cumulative example of
all the above sections in `host.ini` file for this demo:  

```yml
[rock]
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239

[web]
rock03.rock.lan ansible_host=172.16.1.239

[lighttpd:children]
web

[sensors:children]
rock

[bro:children]
sensors

[fsf:children]
sensors

[kafka:children]
sensors

[stenographer:children]
sensors

[suricata:children]
sensors

[filebeat:children]
fsf
suricata

[zookeeper]
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local

[elasticsearch:children]
es_masters
es_data
es_ingest

[es_masters]
# This group should only ever contain exactly 1 or 3 nodes!
#simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local
# Multi-node example #
#elasticsearch0[1:3].simplerock.lan
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239

[es_data]
#simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local
# Multi-node example #
#elasticsearch0[1:4].simplerock.lan
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239

[es_ingest]
#simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local
# Multi-node example #
#elasticsearch0[1:4].simplerock.lan
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239

[elasticsearch:vars]
# Disable all node roles by default
node_master=false
node_data=false
node_ingest=false

[es_masters:vars]
node_master=true

[es_data:vars]
node_data=true

[es_ingest:vars]
node_ingest=true

[docket:children]
web

[kibana:children]
web

[logstash:children]
sensors
```


### SSH Config

After the inventory file entries are finalized, it's time to configure ssh in
order for Ansible to communicate to all nodes during deployment. The ssh-config
command will perform the following on all other nodes in the inventory:  

* add an authorized keys entry
* add the user created at install to the sudoers file

To configure ssh run: `sudo rock ssh-config`  


## Multi-node Deployment

Now, we're finally ready to deploy! As mentioned, there are two main options
for running a deployment:  

1. `deploy-offline` - uses local packages ( located in /srv )
1. `deploy-online` - uses upstream repo packages

Select the deployment method that fits your situation. In our example we'll
choose an offline install. To kick things off run: `sudo rock deploy-offline`  


### Success

Once the deployment is completed with the components you chose, you'll be
congratulated with a success banner. Congratulations!

<p align="center">
<img src="../../img/install_banner.png">
</p>
