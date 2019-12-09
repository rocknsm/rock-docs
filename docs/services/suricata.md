# Suricata

Intrusion Detection Systems (IDS) are a great way to quickly alert on known
bad. Alerts are triggered when a packet matches a defined pattern or
_**signature**_.  

[Suricata](https://suricata-ids.org/) is the IDS / Alerting tool of choice for
RockNSM. It provides a lot of features not available in our previous option.
Most importantly, Suricata offers:  

- multi-threading capability
- active development community and
- frequent feature additions & project momentum


## Service Management

Suricata is deployed as a systemd unit called `suricata.service`. Normal systemd
procedures apply here. It can also be managed using the `rockctl` command using
the same syntax:  

```
sudo systemctl start suricata
sudo systemctl status suricata
sudo systemctl stop suricata
sudo systemctl restart suricata
```

The default ROCK configuration has the Suricata service enabled on startup.  


## Notable Files / Directories

`/etc/suricata/` - main configuration path  
`/var/lib/suricata/` - primary rule path


## Updating Rules

The newest versions of Suricata come with the `suricata-update` command to
manange and update rulesets. The official documentation is found
[here](https://suricata.readthedocs.io/en/suricata-4.1.2/rule-management/suricata-update.html).  


### Enabling Feeds

Suricata Update is a Python module and is automatically bundled with Suricata
starting with version 4.1. While it does have documentation, it’s helpful to
have a practical example. One of the awesome features with Suricata Update is
it comes with a pre-configured list of signature feeds out of the box, both
free and paid. It makes it very simple to enabled paid feeds.

To view the list of available feeds, login to your RockNSM system and run:

$ `sudo suricata-update list-sources`  

This will return something similar to the following:

```yaml
Name: oisf/trafficid
  Vendor: OISF
  Summary: Suricata Traffic ID ruleset
  License: MIT
Name: et/open
  Vendor: Proofpoint
  Summary: Emerging Threats Open Ruleset
  License: MIT
Name: scwx/security
  Vendor: Secureworks
  Summary: Secureworks suricata-security ruleset.
  License: Commercial
  Parameters: secret-code
  Subscription: https://www.secureworks.com/contact/ (Please reference CTU Countermeasures)
Name: scwx/malware
  Vendor: Secureworks
  Summary: Secureworks suricata-malware ruleset.
  License: Commercial
  Parameters: secret-code
  Subscription: https://www.secureworks.com/contact/ (Please reference CTU Countermeasures)
Name: et/pro
  Vendor: Proofpoint
  Summary: Emerging Threats Pro Ruleset
  License: Commercial
  Replaces: et/open
  Parameters: secret-code
  Subscription: https://www.proofpoint.com/us/threat-insight/et-pro-ruleset
Name: ptresearch/attackdetection
  Vendor: Positive Technologies
  Summary: Positive Technologies Attack Detection Team ruleset
  License: Custom
Name: sslbl/ssl-fp-blacklist
  Vendor: Abuse.ch
  Summary: Abuse.ch SSL Blacklist
  License: Non-Commercial
Name: tgreen/hunting
  Vendor: tgreen
  Summary: Heuristic ruleset for hunting. Focus on anomaly detection and showcasing latest engine features, not performance.
  License: GPLv3
Name: etnetera/aggressive
  Vendor: Etnetera a.s.
  Summary: Etnetera aggressive IP blacklist
  License: MIT
```

Without any additional configuration, suricata-update will automatically pull in the et/open ruleset. You can disable this ruleset if you desire. Now, if you are a subscriber to et/pro or another included ruleset that requires an access code (sometimes referred to as an “oinkcode” in Snort parlance), you can pass that on the command line or suricata-update will prompt you.

`suricata-update enable-source et/pro secret-code=xxxxxxxxxxxxxxxx`  

### Manipulating Individual Rules

Often times, we want to turn off specific rules — maybe they’re too noisy for our network, or corporate policy doesn’t concern with browser extensions on BYOD systems. Again, `suricata-update` makes our life easy on our RockNSM sensors.  

```shell
# Elevate to a root shell and go to Suricata dir
sudo -s
cd /etc/suricata

# Generate default suricata-update configs
suricata-update --dump-sample-configs
```

This command will generate six default files:

1. `update.yaml` - the suricata-update config file
1. `enable.conf` - config to enable rules that are usually disabled
1. `disable.conf` - config to disable rules that are usually enabled
1. `modify.conf` - use regex to modify rules
1. `drop.conf` - change rules from alert to drop, not used in RockNSM
1. `threshold.in` - set thresholds to limit too-frequent firing of given alerts

To disable the noisy rule above, we just need to specify its signature ID (e.g. alert.signature_id). Open disable.conf and add the following line:

```
# Disable invalid timestamp rule (sid: 2210044)
    2210044
```

We could alternatively specify the rule using regular expressions:

```
# Disable all SURICATA STREAM alert rules
    re:^alert.*SURICATA STREAM
```

Next, just run `suricata-update`. Note, you want to ensure that `suricata-update` runs as the same user as the `suricata` service. On RockNSM, this is the `suricata` system user. This should really only be necessary the first time `suricata-update` is run, to ensure that when Suricata runs it can read the rules. Near the end of the run, you’ll see a summary how many rules were loaded, disabled, enabled, modified, dropped, and some other stats.

```
sudo -u suricata -g suricata suricata-update
...
27/2/2019 -- 00:08:39 - <Info> -- Loaded 29733 rules.
27/2/2019 -- 00:08:40 - <Info> -- Disabled 68 rules.
27/2/2019 -- 00:08:40 - <Info> -- Enabled 0 rules.
27/2/2019 -- 00:08:40 - <Info> -- Modified 0 rules.
27/2/2019 -- 00:08:40 - <Info> -- Dropped 0 rules.
27/2/2019 -- 00:08:41 - <Info> -- Enabled 188 rules for flowbit dependencies.
27/2/2019 -- 00:08:41 - <Info> -- Backing up current rules.
27/2/2019 -- 00:08:45 - <Info> -- Writing rules to /var/lib/suricata/rules/suricata.rules: total: 29733; enabled: 22272; added: 4; removed 19; modified: 1215
```

You can sanity check that it worked by checking the output for the signature you disabled with grep. You could also search using the same regex as before! If you want to match the regex pattern, be sure to search for a line starting with a # followed by a single space, as this is how the rule is commented out. If the disable configuration worked, you’ll see the rule, but it will be commented out.

```bash
sudo grep 2210044 /var/lib/suricata/rules/suricata.rules
# alert tcp any any -> any any (msg:"SURICATA STREAM Packet with invalid timestamp"; stream-event:pkt_invalid_timestamp; classtype:protocol-command-decode; sid:2210044; rev:2;)
```

To check for a regex you could do this.

```
sudo grep '^# alert.*SURICATA STREAM'
/var/lib/suricata/rules/suricata.rules
...
(a whole bunch of rules match this)
```

### Local Rule Management

Suricata Update lets you manage local rules using the same process above. In the `update.yaml` it defaults to loading all rules in the `/etc/suricata/rules` directory. You could add some local site-specific directory, as well. Suricata Update will parse each of these rules and apply the same operations that you configured, as detailed above.

### Automating It

RockNSM automatically will run your suricata-update process once per day. This is done using crond in `/etc/cron.d/rocknsm_suricata-update` every day at noon UTC (which is the default and recommended RockNSM sensor time zone).  
