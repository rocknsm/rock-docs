# Support Guide

This section aims to smooth out the most frequent issues new users will run into.

## Autodetect Assumptions

When writing the scripts to generate default values, we had to make some
assumptions. The defaults are generated according to these assumptions and
should generally work if your sensor aligns with them. That said, these
assumptions will give you a working sensor, but may need some love for higher
performance. If you cannot meet these assumptions, look at the indicated
configuration variables in `/etc/rocknsm/config.yml` for workaround approaches
(with impact on performance).  

> TIP: We assume that any interface that does not have a default route will be used for collection. Each sensor application will be configured accordingly.

**WARNING**: This so far has been the number one problem with a fresh install
for beta testers!! Check your interface configuration!!

* Two Network Interfaces:
    * a management interface with a default route
    * an interface without a default route (defined by `rock_monifs`)

* You have mounted your largest storage volume(s) under `/data/`
(defined by `rock_data_dir`)

* Your hostname (FQDN) is defined in the `playbooks/inventory/all-in-one.ini` file

* You allow management via SSH from any network (defined by `rock_mgmt_nets`)

* You wish to use Bro, Suricata, Stenographer (disabled by default) and the
whole data pipeline. (See `with_*` options)

* If installed via ISO, you will perform an offline install, else we assume
online (defined by `rock_online_install`)

* Bro will use half of your CPU resources, up to 8 CPUs

We will continue to add more support information as the userbase grows.

## Deployment Script
If you find the deployment is failing, the script can be run with very verbose
output.  This example will write the output to a file for review:  

    `DEBUG=1 ./deploy_rock.sh | tee /tmp/deploy_rock.log`


## Log Timestamps

UTC is generally preferred for logging data as the timestamps from anywhere in the world will have a proper order without calculating offsets. That said, Kibana will present the bro logs according to your timezone (as set in the browser). The bro logs themselves (i.e. in /data/bro/logs/) log in epoch time and will be written in UTC regardless of the system timezone.

Bro includes a utility for parsing these on the command line called `bro-cut`. It can be used to print human-readable timestamps in either the local sensor timezone or UTC. You can also give it a custom format string to specify what you'd like displayed.
