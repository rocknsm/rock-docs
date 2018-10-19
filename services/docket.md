# Docket

## Overview

Docket is the new feature in ROCK 2.1 that we're very excited about, and look forward to feedback from the analysts who spend their time filtering data to find the [baddies](https://v637g.app.goo.gl/qkGzskQTs5goPdBH6).  


#### PCAP vs. Logs

PCAP is great, but perhaps too great.  There's so much detail that it can be overwhelming to sort through.  A great alternate to "following the TCP stream" through an ocean of packets is to use a tool like Bro that can analyze protocols and write logs of what actually happens in the traffic.  The NSM community has needed a solution for quite a while that can merge these two different approaches and complement one other.  Something that balances the verbosity of PCAP and the focus of event-based logs.  

**Enter Docket**: Docket gives an analyst the ability to make very targeted requests to carve out exactly what they want to see in PCAP form by simply providing any of the following fields:  

- multiple intersting IPs
- time range
- port(s)


### Configuration Overview

Docket is being initially served by [lighttpd](https://www.lighttpd.net/) and configured to listen for connection over port `8443`.  





### Basic Usage

Docket is available by pointing your browser to `https://<MGMT-IP>:8443`  


## Management

#### Service

Required services:
- lighttpd
- docket
- stenographer
- stenographer@<monitor-int-name>

example command:  
`sudo systemctl status lighttpd docket stenographer*`  



#### Filesystem Paths

python socket: `/run/docket/`  
requested pcap storage: `/var/spool`  
