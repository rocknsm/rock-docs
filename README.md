<p align="center">
<img src="rock_logo.png">
</p>

---

<p align="center">
<img src="overview/rock-diagram-new.png">
</p>

---

[RockNSM](https://rocknsm.io) is an open-source collections platform designed by the members of the Missouri National Guard Cyber Team (MOCYBER).  It's primary focus is to provide a **reliable**, **scalable**, and **secure** sensor platform for Network Security Monitoring (NSM), network hunting, incident response (IR) missions.  Why choose us over the other names in the NSM game?  If you'd like to jump right into things, head over to [Install Guide](build/install.md).

## Latest

We are pleased to announce that ROCK 2.3 is here! The RockNSM team has been hard at work lately trying to get into a more regular cadence for releases. While RockNSM 2.2 was a relatively small release, 2.3 comes with a lot of changes. You can read the full details in the [changelog](changelog.md), but here's a quick overview of some of the latest additions:

- [x] Support for Elastic 7 pre-release

- [x] Bro 2.6, Suricata 4.2, Elastic 6.6, plus the latest JA3 and ET rules
- [x] Query PCAP directly from Kibana via Docket
- [x] Multi-node support 🙌
- [x] Artifact restructuring
- [x] 61 closed issues (including a lot of outdated items)


##### Elastic 7 Support
We have been performing some early testing with the pre-release versions of Elastic version **7**, and are excited to share that ROCK 2.3 includes support for running on the pre-release version if you would like to do some of your own testing. 


##### Package Updates
This update brings Bro to version 2.6.1, which enables additional protocol analyzers and a lot more event hooks. You can see the full list of changes [here](https://docs.zeek.org/en/stable/install/release-notes.html#bro-2-6). Suricata has been updated to 4.2 and includes the full Suricata protocol analyzer suite, which has some additional coverage for ICS/SCADA stuff beyond what Bro provides.   


##### Multi-node Support
This is a big change that we are very excited to release! When ROCK was originally conceived, its primary purpose was for Network Security Monitoring (NSM) practitioners to be able to hone their craft on a commodity home lab. While that is still a very relevant use case, we have seen a lot of demand for the ability to easily deploy ROCK into an enterprise environment in a scalable manner. Look for another blog in the near future to walk through the multi-node changes in more detail.  


##### Artifact Restructuring
In recent versions of ROCK we stored most installation items under `/opt/rocknsm/rock`. With 2.3 this changes to the more appropriate POSIX compliant file paths. 
See [here](https://github.com/rocknsm/rock/pull/344) for more details.  


##### Closed Issues
This comes back to having full-time staff that are able to dedicate time to the project. We are working hard to close out legacy issues, which will make new issues much easier to triage.


## Video Guides

We've also been hard at work creating video content.
- [ROCK Introduction](https://youtu.be/tcEpI_vpeWc)
  - what ROCK is and how everything works together
- [ROCK@home](https://youtu.be/w8h1ft8QTFk)
  - 3 part series on the lowest barrier to entry: tapping your home network
- [BSidesKC 2018 - Threat Hunting with RockNSM](https://www.youtube.com/watch?v=-Mp1pUXvKuw)
  - RockNSM is a passive network collection platform built by the Missouri Cyber Team to facilitate better incident response operations. This talk by Bradford Dabbs discusses the benefits of a passive first approach and how RockNSM can be used to facilitate it.  

## Contents

[OVERVIEW](overview/index.md) - concept / design, components / dataflow

[BUILD](build/index.md) - installation / configuration / deployment

[OPERATE](operate/index.md) - basic usage / operation

[MAINTAIN](maintain/index.md) - administer / tune / troubleshoot

[SERVICES](services/index.md) - individual service management

[DEV](dev/index.md) - development / testing / customization

## Credit

This project is made possible by the efforts of an ever-growing list of amazing people. Take a look around our project to see all our contributors.

---

Continue to the [Overview](./overview/index.md)
