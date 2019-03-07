# Latest

## Release 2.3

We are pleased to announce that ROCK 2.3 is here! The RockNSM team has been hard at work lately trying to get into a more regular cadence for releases. While RockNSM 2.2 was a relatively small release, 2.3 comes with a lot of changes. You can read the full details in the [changelog](changelog.md), but here's a quick overview of some of the latest additions:

- Support for Elastic 7 pre-release
- Bro 2.6, Suricata 4.2, Elastic 6.6, plus the latest JA3 and ET rules
- Query PCAP directly from Kibana via Docket
- Multi-node support 🙌
- Artifact restructuring
- 61 closed issues (including a lot of outdated items)
~

#### Elastic 7 Support
We have been performing some early testing with the pre-release versions of Elastic version **7**, and are excited to share that ROCK 2.3 includes support for running on the pre-release version if you would like to do some of your own testing. 


#### Package Updates
This update brings Bro to version 2.6.1, which enables additional protocol analyzers and a lot more event hooks. You can see the full list of changes [here](https://docs.zeek.org/en/stable/install/release-notes.html#bro-2-6). Suricata has been updated to 4.2 and includes the full Suricata protocol analyzer suite, which has some additional coverage for ICS/SCADA stuff beyond what Bro provides.   


#### Multi-node Support
This is a big change that we are very excited to release! When ROCK was originally conceived, its primary purpose was for Network Security Monitoring (NSM) practitioners to be able to hone their craft on a commodity home lab. While that is still a very relevant use case, we have seen a lot of demand for the ability to easily deploy ROCK into an enterprise environment in a scalable manner. Look for another blog in the near future to walk through the multi-node changes in more detail.  


#### Artifact Restructuring
In recent versions of ROCK we stored most installation items under `/opt/rocknsm/rock`. With 2.3 this changes to the more appropriate POSIX compliant file paths. 
See [here](https://github.com/rocknsm/rock/pull/344) for more details.  


#### Closed Issues
This comes back to having full-time staff that are able to dedicate time to the project. We are working hard to close out legacy issues, which will make new issues much easier to triage.
