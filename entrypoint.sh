#!/bin/sh
set -e
: "${PORT:=8080}"
sed "s/__PORT__/${PORT}/" /etc/xray/config.json > /tmp/config.json
exec xray run -c /tmp/config.json
