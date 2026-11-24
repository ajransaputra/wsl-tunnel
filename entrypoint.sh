#!/bin/sh
set -e
: "${PORT:=8080}"
: "${UUID:?UUID env var required}"
: "${WSPATH:=/ws}"
sed -e "s/__PORT__/${PORT}/" -e "s/__UUID__/${UUID}/" -e "s#__WSPATH__#${WSPATH}#" \
    /etc/xray/config.json > /tmp/config.json
exec xray run -c /tmp/config.json
