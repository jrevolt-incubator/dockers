FROM jrevolt/jre:8u162

ADD env.sh /

RUN \
	source /env.sh && \
	NEXUS_HOME="/opt/nexus" && \
	NEXUS_DATA="/var/lib/nexus" && \
	URL="http://download.sonatype.com/nexus/3/nexus-${VERSION}-unix.tar.gz" && \
	apk add --update --no-cache curl && \
	echo "Latest:" && \
	curl -s --head "https://sonatype-download.global.ssl.fastly.net/nexus/3/latest-unix.tar.gz" | grep "Location:" && \
	echo "Configured: $URL" && \
	mkdir -p ${NEXUS_HOME} && \
	curl -sjkL "$URL" | tar xzv -C ${NEXUS_HOME} && \
	ln -s ${NEXUS_HOME}/nexus-* ${NEXUS_HOME}/current && \
	mkdir -p ${NEXUS_DATA} && mv ${NEXUS_HOME}/sonatype-work ${NEXUS_DATA}/ && ln -s ${NEXUS_DATA}/sonatype-work ${NEXUS_HOME}/ && \
	addgroup nexus && \
	adduser -SD -h ${NEXUS_DATA} -s /bin/sh -G nexus -u 200 nexus && \
	chown -R nexus:nexus ${NEXUS_HOME} ${NEXUS_DATA} && \
	apk del curl && rm -rf /var/cache/apk/* /var/log/* /tmp/*

EXPOSE 8081
VOLUME ["/var/lib/nexus"]

USER nexus
ENTRYPOINT ["/opt/nexus/current/bin/nexus", "run"]
