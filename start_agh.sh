#!/bin/bash

cp /AdGuardHome.yaml /opt/AdGuardHome/config/AdGuardHome.yaml
chmod 666 /opt/AdGuardHome/config/AdGuardHome.yaml
/opt/AdGuardHome/AdGuardHome -c /opt/AdGuardHome/config/AdGuardHome.yaml
