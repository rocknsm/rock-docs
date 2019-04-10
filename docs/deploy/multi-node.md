FOR PLACEMENT:

select one as the rock "deployment manager" DM
edit inventory file on DM
  vim /etc/rocknsm/hosts.ini
  add ip of all rock flock members under the [rock] group
  can be resolvable hostname or ip
add one rock node to the `[web]` group ex. rock03
add all rock nodes to es-{masters,data,ingest}

SSH-CONFIG
rock ssh-config
  this adds auth keys and sudoers file

---

Let's get started and deploy a single ROCK sensor.

## Assumptions

This document assumes that you have done a fresh installation of ROCK on **all**
ROCK nodes using the [latest ISO](https://mirror.rocknsm.io/isos/stable/).  

1. 3 (minimum) sensors
1. sensors on same network, able to communicate
1. in this demo there are 3 newly installed ROCK sensors:  
    * `rock01.rock.lan - 172.16.1.23X`  
    * `rock02.rock.lan - 172.16.1.23X`  
    * `rock03.rock.lan - 172.16.1.23X`  
1. `admin` account created at install


## Multi-node Configuration

### Designate Deployment Manager

First and foremost, one sensor will need to be designated as the "Deployment
Manager" (referred to as "DM" for the rest of this guide). This is a notional
designation to keep the process clean and as simple as possible. For our lab we
will use `rock01` as the DM.

> NOTE: all following commands will be run from your Deployment Manager (DM) box

Confirm that you can remotely connect to the DM:  
`ssh admin@<DM-ip>`  

Confirm that you can ping all other rock hosts:  
`ping 172.16.1.237`
`ping 172.16.1.239`

### Edit Inventory File

TODO

do this

<p align="center">
<img src="docs/img/#.png">
</p>
<br>


### Step

do this

<p align="center">
<img src="docs/img/#.png">
</p>
<br>


### Step

do this

<p align="center">
<img src="docs/img/#.png">
</p>
<br>


### Step

do this

<p align="center">
<img src="docs/img/#.png">
</p>
<br>


### Step

do this

<p align="center">
<img src="docs/img/#.png">
</p>
<br>


## Multi-node Deployment

aaaaa

### Step

do this

<p align="center">
<img src="docs/img/#.png">
</p>
<br>


### Success

Once the deployment is completed with the components you chose, you'll be
congratulated with a success banner. Congratulations!

<p align="center">
<img src="docs/img/install_banner.png">
</p>




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
rock01.rock.lan ansible_host=127.0.0.1 ansible_connection=local
rock02.rock.lan ansible_host=172.16.1.237
rock03.rock.lan ansible_host=172.16.1.239

# This group should only ever contain exactly 1 or 3 nodes!
#simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local

# Multi-node example #
#elasticsearch0[1:3].simplerock.lan

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





## Hosts File

The first file you may want to edit is `/etc/rocknsm/hosts.ini`. This
file is an [Ansible inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html)
file that defines the target machines when running a playbook.  

If you edit this file in a simple standalone sensor, you're essentially changing
the hostname of your sensor.  

<!-- This is also where you break out server roles for more complex multi-node
deployments. If that fits your needs, see the multi-node clustering guide [here](#). -->

```ini
[rock]
simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local

[web]
simplerockbuild.simplerock.lan ansible_host=127.0.0.1 ansible_connection=local

[sensors:children]
rock

[bro:children]
sensors
...
...
...
```

As you can see in the above example, the default hostname is `simplerockbuild.simplerock.lan`.
To customize this, simply replace _all_ simplerock entries with your own.  
