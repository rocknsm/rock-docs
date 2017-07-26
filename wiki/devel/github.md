# Install via Github
<!-- Derek Ditch <derek@rocknsm.io>; Jeff Geiger <jeff@rocknsm.io>
:icons: font
:experimental: -->

If you already have a clean Centos7 install, you can also clone the https://github.com/rocknsm/rock/[ROCK] repository. The instructions for the ISO above uses a snapshot of the `master` branch.


* clone the repo +
`git clone https://github.com/rocknsm/rock.git`

You can simply run the `/opt/rocknsm/rock/bin/generate_defaults.sh` script with `sudo`. This will generate the file `/etc/rocknsm/config.yml`.

## Generate Defaults

Run the script: +
`cd rock/bin` +
`sudo ./generate_defaults.sh`

## Customize Configs

If you wish to run an offline install (the ISO sets you up for this already) edit `/etc/rocknsm/config.yml` and change the following setting as shown:

```
rock_online_install: False
```

If this value is set to `True`, Ansible will configure your system for the yum repositories listed and pull packages and git repos directly from the URLs given. You could easily point this to local mirrors, if needed.

If this value is set to `False`, Ansible will look for the cached files in `/srv/rocknsm`. There is another script called `offline-snapthot.sh` that will create the necessary repository and file structure. Run this from a system that is Internet connected and copy it to your sensors for offline deployment.

While you're in there, you can change the auto-detected defaults, such as which interfaces to use, hostname, fqdn, resources to use, etc. You can also disable features altogether at the bottom by simply changing the feature value to `False` as shown below. Don't do this unless you know what you're doing.

```
with_nginx: False <1>
```
<1> This disables nginx from installing or being configured. Note that it will not remove it if it is already present.

## Deploy ROCK

Once you've completed flipping the bits as you see fit, simply run: +
`sudo /opt/rocknsm/rock/bin/deploy_rock.sh` +
If everything is well, this should install all the components and give you a success banner.

* success banner screenshot *TODO*




// You're now ready for link:content/installation.adoc[Installation]
