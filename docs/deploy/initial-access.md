We strive to do the little things right, so rather than having Kibana available
to everyone in the free world, it's sitting behind a reverse proxy and secured
by an [(XKCD) Passphrase](https://xkcd.com/936/).  

The credentials are written to the home directory of the user that runs the
deploy script. Most of the time, this will be the administrative user
created at installation e.g. `/home/admin`.

## Kibana

To get into the Kibana interface:  

*Note: we are aware of a new change with macOS Catalina and the Chrome browser that requires SSL certificates are signed with a CA. We're working on the issue and will update the SSL proxy process soon. Until then, Safari and Firefox work. Windows is not affected.*

1. Copy the passphrase in `~/KIBANA_CREDS.README`  
2. Point your browser to Kibana:   
    * `https://<SENSORIP>`
    * `https://<HOSTNAME>` (if you have DNS set up)
3. Enter the user and password
4. Profit!  
