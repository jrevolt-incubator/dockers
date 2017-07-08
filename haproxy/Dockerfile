FROM jrevolt/alpine

RUN apk --no-cache --update add haproxy ca-certificates

COPY haproxy.cfg /etc/haproxy/haproxy.cfg

VOLUME ["/etc/haproxy"]

ENTRYPOINT ["haproxy"]
CMD ["-f", "/etc/haproxy/haproxy.cfg", "-d"]
