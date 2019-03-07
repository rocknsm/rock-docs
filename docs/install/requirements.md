# Requirements

Installation of ROCK can be broken down into three main steps:  

1. Install
1. Configure
1. Deploy

Before that, let's cover what you're going to need before starting.  


## Sensor Hardware

The analysis of live network data is a resource intensive task, so the higher
the IOPS the better.  Here's the bottom line:

> **If you throw hardware at ROCK it will use it, and use it well.**


### Minimum Specs
<br>

|   RESOURCE  |     RECOMMENDATION |
| ----------- | ------------------ |
| CPU         | **4+** physical cores |
| Memory      | **8GB** RAM minimum, the more the better ) |
| Storage     | **256GB**, with 200+ of that dedicated to `/data`, SSD preferred |
| Network     | **2 gigabit interfaces**, one for management and one for collection |


## Install Media

- ROCK install image - download `.iso` **[here](https://download.rocknsm.io/isos/stable/)**
- 8GB+ capacity USB drive - to apply install image
- BIOS settings to allow booting from mounted USB drive


## Network Connection

ROCK is first and foremost a _**passive**_ network sensor and is designed with
the assumption that there may not be a network connection available during
install. There's some built-in flexibility with deploying ROCK, and this will
be clarified more in then next sections.  
<br>
<br>

> NOTE: Check out the [ROCK@home Video Series](https://www.youtube.com/channel/UCUD0VHMKqPkdnJshsngZq9Q) that goes into detail on many things about deploying ROCK to include hardware choices for both sensor and network equipment.
