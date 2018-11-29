# Latest Updates

We've been hard at work improving ROCK and a lot has changed since we released the initial Chef build.

### Overview

First and foremost, the build now uses Ansible for the automation. Most packages are updated to the latest greatest. Snort and Pulledpork are now fully depreciated. From a usage standpoint, one of the more significant upgrades is the work we've put into Kibana. The data model is slightly different to the advantage of the analyst.

### ISO Install

We now have an ISO that contains everything you need to deploy! The ISO is merely a snapshot of packages available at the time and latest snapshot of various Git repositories.

### Full Packet Capture
Google Stenographer is installed and configured in this build. However, it is disabled by default. There are a few reasons for this:
* it can be a bit too much for builds on meager hardware.
* you need to make sure you've mounted `/data` over sufficient storage before you start saving full pcap.

Once you're ready to get nuts, enable and start the service:

`systemctl enable stenographer.service`
`systemctl start stenographer.service`

Stenographer is already stubbed into the `/usr/local/bin/rockctl {start,stop,status}` scripts, so just uncomment it if you're going to use it.

<!-- Stenographer is already stubbed into the `/usr/local/bin/rock_{start,stop,status}` scripts, so just uncomment it if you're going to use it. -->

### Component Updates

Some of the biggest changes with ROCK 2.2 are upgrading all the software to the latest versions. Here's a list.

Software | Version | Notes  |
---------|---------|------
CentOS | 7.5 (1804) |
Bro    | 2.5.5-debug | Plugins for kafka output and af_packet capture
Suricata | 4.0.5 |
Stenographer | Git 12106b |
Kafka | 0.10.0.0 |
Elasticsearch | 6.4.2 |
Logstash | 6.4.2 |
Kibana | 6.4.2 |
Ansible | 2.7.0 |


### Ansible

On top of software updates, we've chosen to use Ansible as the primary deployment mechanism.  We did this for a few reasons:

* it's lightweight
* doesn't require an agent
* available in EPEL
* easy to understand

We're ultimately goal is to make this platform more approachable to a wider community and better suitable to offline or isolated install environments, which we've encountered frequently for sensor networks.
