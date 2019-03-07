# Docket

Docket is a web UI that makes it easy for analysts to filter mountains of PCAP down to specific chunks in order to find the [baddies](https://v637g.app.goo.gl/qkGzskQTs5goPdBH6).

<p align="center">
https://[sensorip]/app/docket/
</p>
<br>

<p align="center">
<img src="../../img/docket.png">
</p>

## Overview

PCAP is great, but doesn't scale well.  There's so much detail that it can be overwhelming to sort through.  A great alternate to "following the TCP stream" through an ocean of packets is to use a tool like Docket that allows for easy filtering on key points such as:

- timeframe
- hosts
- networks
- ports
- more ...

The NSM community has needed a solution like Docket for a while, and we're excited to see how it empowers the analysis process.


## Basic Usage

To access Docket point to `https://<sensorip>/app/docket/`. Please note the **trailing slash**.  (This is due to Kibana being served from the same proxy and gets greedy with the URL path).  


#### Submit Request

<p align="center">
<img src="../../img/docket-submit.png">
</p>

Once into the UI simply add your search criteria and click "Submit".  


#### Get PCAP

<p align="center">
<img src="../../img/docket-getpcap.png">
</p>

Once the job is processed, click "Get PCAP" to download to your box locally.


## Management

#### Services

Docket requires the following services to function:  

- `lighttpd` - TLS connection
- `stenographer` - tool to write / query pcap
- `stenographer@<int>` - process for each monitor interface

Current status can be checked with the following commands:  

`sudo systemctl status lighttpd`  

`sudo rockctl status`  


## Directories

Here are some important filesystem paths that will be useful for any necessary
troubleshooting efforts:  

### PCAP Storage

User requested PCAP jobs are saved in:  

`/var/spool/docket`  

In a multi-user environment this directory can fill up depending on how much space has been allocated to the `/var` partition.  Keep this path clean to prevent issues.  

### Python Socket

`/run/docket/`  
