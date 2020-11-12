#!/bin/bash

# register a subdomain at https://www.duckdns.org/ to get your token
#add to crontab:
#30 03 * * * /home/conor/bin/ddns.sh
# set the following in ~/.ddns
# export DDNS_SUBDOMAIN="duckdns.test"
# export DDNS_TOKEN="dummy-token"
source ${HOME}/.ddns
curl --silent "https://www.duckdns.org/update?domains=$DDNS_SUBDOMAIN&token=$DDNS_TOKEN&ip=" >/dev/null 2>&1

