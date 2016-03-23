FROM jrevolt/alpine

RUN apk --no-cache --update add dnsmasq

ADD run.sh /usr/local/bin/dnsmasq.sh

ENTRYPOINT ["/usr/local/bin/dnsmasq.sh"]


