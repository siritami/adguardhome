#!/bin/bash

if [ ! -e /opt/adguardhome/conf/AdGuardHome.yaml ]; then
  cp /AdGuardHome.yaml /opt/adguardhome/conf/AdGuardHome.yaml
fi

chmod 600 /opt/adguardhome/conf/AdGuardHome.yaml

/opt/adguardhome/adguardhome -c /conf/AdGuardHome.yaml
