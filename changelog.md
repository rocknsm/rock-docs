# Updates - v2.1

We've been hard at work improving ROCK and a lot has changed since we released the initial Chef build.


### Overview

First and foremost, the build now uses Ansible for the automation. Most packages are updated to the latest greatest, and we've swapped in Suricata and the default signature IDS over Snort. Some of the most significant upgrade, from a use standpoint, is the work we've put into Kibana. The data model is slightly different, to the advantage of the analyst.


### ISO Install

We now have an ISO that contains everything you need to deploy! The ISO is merely a snapshot of packages available at the time and latest snapshot of various Git repositories.


### Full Packet Capture
Google's Stenographer is installed and configured in this build. However, it is disabled by default. There are a few reasons for this: First, it can be too much for Vagrant builds on meager hardware. Second, you really need to make sure you've mounted /data over sufficient storage before you start saving full packets. Once you're ready to get nuts, enable and start the service with `systemctl enable stenographer.service` and then `systemctl start stenographer.service`. Stenographer is already stubbed into the `/usr/local/bin/rock_{start,stop,status}` scripts, you just need to uncomment it if you're going to use it.


### Component Updates

Some of the biggest changes with ROCK 2.0 are upgrading all the software to the latest versions. Here's a list.

| Software | Version | Notes
| CentOS | 7.3 (1611) |
| Bro    | 2.5 | Plugins for kafka output and af_packet capture
| Suricata | 3.1.3 | _This is now the default signature-based IDS_
| Snort | 2.9.8.3 | _This is now an optional replacement for suricata_
| Stenographer | Git 12106b |
| Kafka | 0.10.0.0 |
| Elasticsearch | 5.1.1 |
| Logstash | 5.1.1 |
| Kibana | 5.1.1 |
| Ansible | 2.2.0.0 |


### Ansible

On top of software updates, we also changed the deployment mechanism to using Ansible as the primary mechanism. We did this for a few reasons: I used it for one of my full-time projects, it's super lightweight and available in EPEL, doesn't require an agent, super easy to understand. I'm hoping that ultimately this makes the platform more approachable to a wider community and better suitable to offline or isolated install environments, which I've frequently encountered for sensor networks.
