#!/bin/bash

if [ ! -e /opt/AdGuardHome/config/AdGuardHome.yaml ]; then
  cp /AdGuardHome.yaml /opt/AdGuardHome/config/AdGuardHome.yaml
fi

chmod 600 /opt/adguardhome/conf/AdGuardHome.yaml

/opt/adguardhome/ -c /conf/AdGuardHome.yaml
