<p align="center">
<img src="rock_logo.png">
</p>

[RockNSM](https://rocknsm.io) is an open-source collections platform designed by the members of the Missouri National Guard Cyber Team (MOCYBER).  It's primary focus is to provide a **robust**, **scalable**, and **secure** sensor platform for both enduring security monitoring (NSM) and incident response (IR) missions.  Why choose us over the other names in the NSM game?  Continue to the [OVERVIEW](overview/index.md).


## Latest

We've been working on a lot of changes and ROCK 2.1 is here! You can read the full details in the [changelog](changelog.md), but here's a quick overview of some of the latest additions:

##### New Features  
- Docket, a REST API and web UI to query multiple stenographer instances
- Added Suricata-Update to manage Suricata signatures
- GPG signing of packages and repo metadata
- Added functional tests using [testinfra](https://testinfra.readthedocs.io/en/latest/)
- Initial support of [Elastic Common Schema](https://github.com/elastic/ecs)
- Includes full Elastic (with permission) stack including features formerly known as X-Pack

##### Upgrades  
- Elastic Stack is updated to 6.x
- Elastic dashboards, mappings, and Logstash config moved to module-like construct
- Suricata is updated to 4.x
- Bro is updated to 2.5.4

##### Deprecated - will be removed in the next release
- Snort
- Pulled Pork

### Video Guides

We've also been hard at work creating video content.
- [ROCK Introduction](https://youtu.be/tcEpI_vpeWc) - what ROCK is and how everything works together
- [ROCK@home](https://youtu.be/w8h1ft8QTFk) - 3 part series on the lowest barrier to entry: tapping your home network


## Contents

[OVERVIEW](overview/index.md) - concept / design, components / dataflow  

[BUILD](build/index.md) - installation / configuration / deployment  

[OPERATE](operate/index.md) - basic usage / operation 

[MAINTAIN](maintain/index.md) - administer / tune / troubleshoot

[SERVICES](services/index.md) - individual service management

[DEV](dev/index.md) - development / testing / customization


## Credit

This project is made possible by the efforts of an ever-growing list of amazing people. Take a look around our project to see all our contributors.
