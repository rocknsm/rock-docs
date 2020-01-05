# Changelog

## 2.5 -- 2019-08-21

- New: ROCK has move to the ECS standard
- New: Out of the box support for XFS Disk Quotas
- New: Updated ROCK Dashboards
- Fix: Various visualization issues in ROCK dashboard
- Fix: (x509) Certificate issues resolved
- Update: Elastic Stack components to version 7.3

## 2.4 -- 2019-04-02

- New: Text User Interface (TUI) for initial host setup  
- New: ROCK manager utility  
- New: Automated Testing Infrastructure  
- Fixes: 95 closed issues  
- Upgrade: Elastic 6.6 -> 6.7.1  
- Upgrade: Suricata 4.1.1 -> 4.1.3  
- Upgrade: Zookeeper 3.4.11 -> 3.4.13  


## 2.3 -- 2019-02-25

- New: Add ability to do multi-host deployment of sensor + data tiers (#339)
- New: Integrate Docket into Kibana by default
- New: Improvements and additional Kibana dashboards
- Fixes: issue with Bro failing when monitor interface is down (#343)
- Fixes: issue with services starting that shouldn’t (#346)
- Fixes: race condition on loading dashboards into Kibana (#356)
- Fixes: configuration for Docket allowing serving from non-root URI (#361)
- Change: bro log retention value to one week rather than forever (#345)
- Change: Greatly improve documentation  (#338)
- Change: Reorganize README (#308)
- Change: Move ECS to rock-dashboards repo (#305)
- Change: Move RockNSM install paths to filesystem hierarchy standard locations (#344)


## 2.2 -- 2018-10-26  

- Feature: rockctl command to quickly check or change services  
- Feature: Docket, a REST API and web UI to query multiple stenographer instances, now using TCP port 443  
- Optimization: Kibana is now running on TCP port 443  
- Feature: Added Suricata-Update to manage Suricata signatures  
- Feature: GPG signing of packages and repo metadata  
- Feature: Added functional tests using testinfra  
- Feature: Initial support of Elastic Common Schema  
- Feature: Elastic new Features  
  - Canvas  
  - Elastic Maps Service  
- Feature: Include full Elasticstack (with permission) including features formerly known as X-Pack:  
  - Graph  
  - Machine Learning  
  - Reporting  
  - Security  
  - Monitoring  
  - Alerting  
  - Elasticsearch SQL  
- Optimization: Elastic dashboards, mappings, and Logstash config moved to module-like construct  
- Upgrade: CentOS is updated to 7.5 (1804)  
- Upgrade: Elastic Stack is updated to 6.4.2  
- Upgrade: Suricata is updated to 4.0.5  
- Upgrade: Bro is updated to 2.5.4  


## 2.1 -- 2018-08-23  

<!--
New: description
Fixes: description
Change: description

Feature: description
Bug: description
Optimization: description
Upgrade: description
-->
