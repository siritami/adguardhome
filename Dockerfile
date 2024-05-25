FROM adguard/adguardhome:latest as base

EXPOSE 80 10443/tcp 10443/udp 10853/tcp 10853/udp 6060

RUN mkdir -p /opt/adguardhome/conf && \
    mkdir -p /opt/adguardhome/work &&
