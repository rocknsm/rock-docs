# What is ROCK

<p align="center">
<img src="../../img/rock-diagram-new.png">
</p>

### The Mission

* **Reliable** - we believe the folks at Red Hat do Linux right.  ROCK is built on Centos7 and provides an easy path to a supported enterprise OS ([RHEL](https://www.redhat.com/en)).

* **Secure** - with SELinux, ROCK is highly secure by default.  [SELinux](https://selinuxproject.org/page/Main_Page) uses context to define security controls to prevent, for instance, a text editor process from talking to the internet.  [#setenforce1](https://twitter.com/search?q=%23setenforce1&src=typd)

* **Scalable** - Whether you're tapping a SoHo network or a large enterprise, ROCK is designed with scale in mind.

<!-- * LOVE - Our love of Red Hat is only matched by our love of IBM. -->


### Capability

* Passive and reliable high-speed data acquisition via AF_PACKET, feeding systems for metadata (Bro), signature detection (Suricata), extracted network file metadata (FSF), and full packet capture (Stenographer).

* A messaging layer (Kafka and Logstash) that provides flexibility in scaling the platform to meet operational needs, as well as providing some degree of data reliability in transit.

* Reliable data storage and indexing (Elasticsearch) to support rapid retrieval and analysis (Kibana and Docket) of the data.

* Pivoting off Kibana data rapidly into full packet capture (Docket and Stenographer).


### Components

* Full Packet Capture via [Google Stenographer](https://github.com/google/stenographer)

* Protocol Analysis and Metadata via [Bro](https://www.bro.org/)

* Signature Based Alerting via [Suricata](https://suricata-ids.org/)

* Recursive File Scanning via [FSF](https://github.com/EmersonElectricCo/fsf).

* Output from Suricata and FSF are moved to message queue via [Filebeat](https://www.elastic.co/products/beats/filebeat)

* Message Queuing and Distribution via [Apache Kafka](http://kafka.apache.org/)

* Message Transport via [Logstash](https://www.elastic.co/products/logstash)

* Data Storage, Indexing, and Search via [Elasticsearch](https://www.elastic.co/)


### Analyst Toolkit

* [Kibana](https://www.elastic.co/products/kibana) provides data UI and visualization

* [Docket](../services/docket.md) allows for quick and targeted pivoting to PCAP
