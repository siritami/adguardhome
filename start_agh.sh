#!/bin/bash

if [ ! -e /opt/AdGuardHome/config/AdGuardHome.yaml ]; then
  cp /AdGuardHome.yaml /opt/AdGuardHome/config/AdGuardHome.yaml
fi

chmod 666 /opt/AdGuardHome/config/AdGuardHome.yaml
chmod 666 /config/AdGuardHome.yaml
chmod 666 /config/.AdGuardHome.yaml
/opt/AdGuardHome/AdGuardHome -c /opt/AdGuardHome/config/AdGuardHome.yaml
