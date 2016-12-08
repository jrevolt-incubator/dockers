FROM jrevolt/alpine

RUN apk --no-cache --update add squid

COPY squid.conf /etc/squid/squid.conf
COPY run.sh /run.sh

EXPOSE 3128
VOLUME ["/etc/squid"]
VOLUME ["/var/cache/squid"]
VOLUME ["/var/log/squid"]

ENTRYPOINT ["/run.sh"]

