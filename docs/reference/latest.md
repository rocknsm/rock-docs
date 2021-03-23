# Latest

## Release 2.5

We are pleased to announce that ROCK 2.5 is out! Here's a quick overview of
some of the latest additions:


NEW - ROCK has moved to the [ECS](https://github.com/elastic/ecs) standard!

  - legacy pipeline is still available (on ISO install)
  - aliases are in place to assist backwards compatibility

NEW - Out of the box support for XFS Disk Quotas

  - puts quota on `/data` or falls back to `/`
  - works for both automated and manual installs
  - standalone playbook to setup quotas on installs other than ISO download (reboot req.)
  - the amount of disk given to a service is enabled by weight

NEW - Updated ROCK Dashboards

  - available in ISO install
  - incorporating Vega into dashboards

FIX - various visualization issues in ROCK dashboard

FIX - x509 certificate issues resolved

UPDATE - All Elastic Stack components to [v7.6](https://www.elastic.co/blog/elasticsearch-7-6-0-released)

NEW - Updated Zeek to version 3

NEW - Updated Suricata to version 5
