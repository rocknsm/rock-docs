# Deployment

Once your configuration files have been tuned to suit your environment, it's
time to cover the 2 scripts available to the user. These scripts are located in
your `$PATH` and are important tools to understand:  

1. `generate_defaults.sh`
1. `deploy_rock.sh`


## Generate Defaults

This script writes your configuration files (`config.yml` and `hosts.ini`)
to their factory default state. This script is **already run** at install so
it's not necessary to run right now.   

> So why do I care about this generate_defaults.sh thing?

Great question! This very helpful when you begin editing your configs and get
into a mess.  It's a solution for when you need to restore the base configuration
files back to their factory defaults.  

Simply execute the script to get you out of config file purgatory:  
```
sudo generate_defaults.sh
```

It's important to note that this resets _configuration files_ and **not**
any data.

## Deploy

Now it's finally time to **deploy this thing**. This is done by running the deployment
script, which is kicked off by running:
```
sudo deploy_rock.sh
```

Once the deployment is completed with the components you chose, you'll be
congratulated with a success banner. Congratulations!  

<p align="center">
<img src="../img/install_banner.png">
</p>
<!-- <p align="center">
<a href="https://asciinema.org/a/2rS2u1fJzhaNVtkuKWgqd5BQl" target="\_blank"><img src="https://asciinema.org/a/2rS2u1fJzhaNVtkuKWgqd5BQl.png" width="469"/></a>
</p>   -->


## Initial Kibana Access
We strive to do the little things right, so rather than having Kibana available
to everyone in the free world, it's sitting behind a reverse proxy and secured
by a [passphrase](https://xkcd.com/936/).  

The credentials are written to the home directory of the user that runs the
deploy script. Most of the time, this will be the administrative user
created at installation e.g. `/home/admin`.

To get into Kibana:  

1. copy the passphrase in `~/KIBANA_CREDS.README`  
2. point your browser to Kibana:   
    * `https://[ip address]`
    * `https://[hostname]` (if you have DNS set up)
3. enter user and password
4. profit!  

