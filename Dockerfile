#
# This is unofficial dockerized precompiled AdGuardHome within a debian:stable-slim image.
#

FROM debian:stable-slim
MAINTAINER Bob <kcey@mail.ru>

COPY AdGuardHome.yaml /opt/AdGuardHome/config/AdGuardHome.yaml
COPY start_agh.sh /start_agh.sh

RUN export DEBIAN_FRONTEND=noninteractive \
&& export URL=https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest \
&& export OS="linux" \
&& apt-get update && apt-get upgrade -y \
&& apt-get install --no-install-recommends -y ca-certificates wget curl \
&& cd /opt \
&& wget --tries=3 $(curl -s $URL | grep browser_download_url | egrep -o 'http.+\.\w+' | grep -i "$(dpkg --print-architecture)" | grep -m 1 -i "$(echo $OS)") \
&& tar -xvzf *.tar.gz \
&& rm *.tar.gz \
&& mkdir /opt/AdGuardHome/config \
&& chmod a+rx /start_agh.sh \
&& apt-get purge -y -q --auto-remove wget curl \
&& apt-get clean \
&& cd / \
&& rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

VOLUME [ "/opt/AdGuardHome/config" ]

EXPOSE 53/tcp 53/udp 67/udp 68/udp 80/tcp 443/tcp 443/udp 853/tcp 853/udp 3000/tcp 3000/udp 5443/tcp 5443/udp 6060/tcp

ENTRYPOINT ["/start_agh.sh"]
