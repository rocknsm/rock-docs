# Quick Start Guide
Derek Ditch <derek@rocknsm.io>; Jeff Geiger <jeff@rocknsm.io>
:icons: font
:experimental:

## Hardware Requirements

If you'd like to cut through the fluff and get going, check out the link:content/installation.adoc[ROCK 2.0 - Installation].

[[hardware-requirements]]

### Hardwaree
_(For anything other than a Vagrant build)_

NOTE: This is a shadow of a recommendation of a guideline. Your mileage may vary. No returns or refunds.

|===
| Resource | Recommendation

| CPU
| 4 or more physical cores.

| Memory
| 16GB (You can get away with 8GB, but it won't collect for long.)

| Storage
| 256GB, with 200+ of that dedicated to `/data`. Honestly, throw everything you can at it. The higher the IOPS the better.

| Network
| The system needs at least 2 network interfaces, one for management and one for collection.
|===

**GOLDEN RULE:** If you throw hardware at it, ROCK will use it. It will require some tuning to do so, but we'll continue documenting that.

## Data Model






## Sensor Schtuffz

[[autodetect-assumptions]]

### Autodetect Assumptions

When writing the scripts to generate default values, we had to make some assumptions. The defaults are generated according to these assumptions and should generally work if your sensor aligns with them. That said, these assumptions will give you a working sensor, but may need some love for higher performance. If you cannot meet these assumptions, look at the indicated configuration variables in `/etc/rocknsm/config.yml` for workaround approaches (with impact on performance).

* You have two network interfaces:
** A management interface with a default route
** An interface without a default route (defined by `rock_monifs`)

TIP: We assume that any interface that does not have a default route will be used for collection. Each sensor application will be configured accordingly.

WARNING: This so far has been the number one problem with a fresh install for beta testers!! Check your interface configuration!!

* You have mounted your largest storage volume(s) under `/data/` (defined by `rock_data_dir`)
* Your hostname (FQDN) is defined in the `playbooks/inventory/all-in-one.ini` file.
* You allow management via SSH from any network (defined by `rock_mgmt_nets`)
* You wish to use Bro, Suricata, Stenographer (disabled by default) and the whole data pipeline. (See `with_*` options)
* If installed via ISO, you will perform an offline install, else we assume online (defined by `rock_online_install`)j
* Bro will use half of your CPU resources, up to 8 CPUs
