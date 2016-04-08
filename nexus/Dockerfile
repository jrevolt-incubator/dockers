FROM jrevolt/jre

ADD nexus-3.0.0-m6-unix.tar.gz /opt/

RUN mv /opt/nexus-* /opt/nexus && \
	adduser -SD -h /var/nexus -G root nexus && \
	mv /opt/nexus/data /var/nexus/data && \
	chown -R nexus:root /var/nexus/data && \
	ln -s /var/nexus/data /opt/nexus/data

ENV PATH /opt/nexus/bin:${PATH}

VOLUME ["/var/nexus/data"]

USER nexus
ENTRYPOINT ["/opt/nexus/bin/nexus", "run"]
