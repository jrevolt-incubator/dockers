FROM jrevolt/jre

ADD nexus-3.1.0-04-unix.tar.gz /opt/nexus/

RUN \
	ln -s /opt/nexus/nexus-* /opt/nexus/current && \
	mkdir -p /var/lib/nexus && mv /opt/nexus/sonatype-work /var/lib/nexus/ && ln -s /var/lib/nexus/sonatype-work /opt/nexus/ && \
	adduser -SD -h /var/nexus -G root -u 200 nexus && \
	chown -R nexus:root /opt/nexus/current/etc /var/lib/nexus

ENV PATH /opt/nexus/current/bin:${PATH}

EXPOSE 8081
VOLUME ["/var/lib/nexus"]

USER nexus
ENTRYPOINT ["/opt/nexus/current/bin/nexus", "run"]
