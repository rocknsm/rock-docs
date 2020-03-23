# Tips and Tricks
### Tip #1
Need to ingest historic PCAP, but want to tag it for a collection location?
use the following command:
```
zeek -C -r PCAPFILE.pcap local "ROCK::sensor_id=PCAPCOLLECTIONPOINT"
```
This will update the observer.hostname field in your kibana instance! 

---
### Tip  #2 
---
### Tip  #3
---
### Tip  #4
---