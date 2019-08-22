We strive to do the little things right, so rather than having Kibana available
to everyone in the free world, it's sitting behind a reverse proxy and secured
by an [(XKCD) Passphrase](https://xkcd.com/936/).  

The credentials are written to the home directory of the user that runs the
deploy script. Most of the time, this will be the administrative user
created at installation e.g. `/home/admin`.

## Kibana

To get into the Kibana interface:  

1. Copy the passphrase in `~/KIBANA_CREDS.README`  
2. Point your browser to Kibana:   
    * `https://<SENSORIP>`
    * `https://<HOSTNAME>` (if you have DNS set up)
3. Enter the user and password
4. Profit!  
