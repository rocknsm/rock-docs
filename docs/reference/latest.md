# Latest

## Release 2.4

We are pleased to announce that ROCK 2.4 is out! Check out the the full
[blog post](#) for the full details on version 2.4. Here's a quick overview of
some of the latest additions:

- NEW - Text UI (TUI) for initial host setup
- NEW - ROCK manager utility
- NEW - Automated Testing Infrastructure
- Feature selection improvements
- 95 Closed Issues
- Package Updates:
    - Elastic 6.6 -> 7.0
    - Suricata 4.1.1 -> 4.1.3
    - Zookeeper 3.4.11 -> 3.4.14
    - Kafka 1.0.0 -> 2.2.0
    - Stenographer 0.1 -> 0.2
    - Unrar 5.5.2 -> 5.7.3


#### Elastic 7
[Elastic 7.0](https://www.elastic.co/blog/elastic-stack-7-0-0-released) brings
some nice new features such as, Index Lifecycle Management, redesigned Kibana
UI, and a new cluster discovery mechanism.


#### Package Updates
As mentioned above, this update brings Elastic to version 7, but also updates of
Suricata, Zookeeper, Kafka, Stenographer, and others. You can see the full list of changes [here](#).


#### Multi-node Support
This is a big change that we are very excited to release! When ROCK was
originally conceived, its primary purpose was for Network Security Monitoring
(NSM) practitioners to be able to hone their craft on a commodity home lab.
While that is still a very relevant use case, we have seen a lot of demand for
the ability to easily deploy ROCK into an enterprise environment in a scalable
manner.


#### Closed Issues
We are continuing to burn through long-running issues with this release. There
were also several new issues that slipped into 2.3 that have been addressed.
Namely, we improved the way rolling restarts are handled for Elasticsearch and
are continuing to make multinode deployments as smooth and hands-off as possible.
