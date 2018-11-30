<p align="center">
<img src="rock_logo.png">
</p>

---

<p align="center">
<img src="overview/rock-diagram-new.png">
</p>

---

[RockNSM](https://rocknsm.io) is an open-source collections platform designed by the members of the Missouri National Guard Cyber Team (MOCYBER).  It's primary focus is to provide a **reliable**, **scalable**, and **secure** sensor platform for Network Security Monitoring (NSM), network hunting, incident response (IR) missions.  Why choose us over the other names in the NSM game?  Continue to the [OVERVIEW](overview/index.md).


## Latest

We've been working on a lot of changes and ROCK 2.2 is here! You can read the full details in the [changelog](changelog.md), but here's a quick overview of some of the latest additions:

##### New Features
- rockctl command to quickly check or change services
- Docket, a REST API and web UI to query multiple stenographer instances, now using TCP port 443
- Kibana is now running on TCP port 443
- Added Suricata-Update to manage Suricata signatures
- GPG signing of packages and repo metadata
- Added functional tests using [testinfra](https://testinfra.readthedocs.io/en/latest/)
- Initial support of [Elastic Common Schema](https://github.com/elastic/ecs)
- Elastic new Features
  - Canvas
  - Elastic Maps Service, fullscreen, heatmaps, and more
- Includes full Elastic Stack (with permission) including features formerly known as X-Pack:
  - Graph
  - Machine Learning
  - Reporting
  - Security
  - Monitoring
  - Alerting
  - Elasticsearch SQL

##### Upgrades
- Elastic Stack is updated to 6.4.2
- Elastic dashboards, mappings, and Logstash config moved to module-like construct
- Suricata is updated to 4.0.5
- Bro is updated to 2.5.4

## Video Guides

We've also been hard at work creating video content.
- [ROCK Introduction](https://youtu.be/tcEpI_vpeWc)
  - what ROCK is and how everything works together
- [ROCK@home](https://youtu.be/w8h1ft8QTFk)
  - 3 part series on the lowest barrier to entry: tapping your home network
- [BSidesKC 2018 - Bradford Dabbs - Threat Hunting with RockNSM](https://www.youtube.com/watch?v=-Mp1pUXvKuw)
  - RockNSM is a passive network collection platform built by the Missouri Cyber Team to facilitate better incident response operations. This talk will discuss the benefits of a passive first approach and how RockNSM can be used to facilitate it.

## Contents

[OVERVIEW](overview/index.md) - concept / design, components / dataflow

[BUILD](build/index.md) - installation / configuration / deployment

[OPERATE](operate/index.md) - basic usage / operation

[MAINTAIN](maintain/index.md) - administer / tune / troubleshoot

[SERVICES](services/index.md) - individual service management

[DEV](dev/index.md) - development / testing / customization

## Credit

This project is made possible by the efforts of an ever-growing list of amazing people. Take a look around our project to see all our contributors.
