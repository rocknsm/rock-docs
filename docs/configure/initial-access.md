We strive to do the little things right, so rather than having Kibana available
to everyone in the free world, it's sitting behind a reverse proxy and secured
by a [passphrase](https://xkcd.com/936/).  

The credentials are written to the home directory of the user that runs the
deploy script. Most of the time, this will be the administrative user
created at installation e.g. `/home/admin`.

## Kibana

To get into the Kibana interface:  

1. copy the passphrase in `~/KIBANA_CREDS.README`  
2. point your browser to Kibana:   
    * `https://[ip address]`
    * `https://[hostname]` (if you have DNS set up)
3. enter user and password
4. profit!  
