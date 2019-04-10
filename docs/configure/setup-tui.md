## Overview

Another new 2.4 feature is the Setup (**T**)ext (**U**)ser (**I**)nterface. This
allows for a unified interface in order to configure ROCK sensor settings. The
new interface can be called by running either:  

* `sudo rock setup`
* `sudo rock tui`


<p align="center">
<img src="docs/img/#.png">
</p>

> The Setup TUI currently only supports configuring a deploying a single-node
instance of ROCK.


## Building Manually

For the ROCK veterans in the house, you can still run a manual build by:  

1. customizing your config file at: `/etc/rocknsm/config.yml`
2. deploy with the new rock manager using preferred packages:  

    * `sudo rock deploy-offline`  
    * `sudo rock deploy-online`  
