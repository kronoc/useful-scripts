#!/bin/sh

# register a subdomain at https://www.duckdns.org/ to get your token
# set the following in .bashrc
# export DDNS_SUBDOMAIN="duckdns.test"
# export DDNS_TOKEN="dummy-token"

curl --silent "https://www.duckdns.org/update?domains=$DDNS_SUBDOMAIN&token=$DDNS_TOKEN&ip=" >/dev/null 2>&1
