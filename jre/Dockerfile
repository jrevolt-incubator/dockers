FROM jrevolt/alpine:3.6.2

ENV JAVA_HOME="/opt/java"
ENV PATH="${JAVA_HOME}/bin:${PATH}"
ENV BUILD=181

RUN \
	cd /tmp && \
	apk add --update curl ca-certificates java-cacerts && \
	# oracle server JRE (alpine)
	URL1="http://download.java.net/java/jdk9-alpine/archive/${BUILD}/binaries/serverjre-9-ea+${BUILD}_linux-x64-musl_bin.tar.gz" && \
	URL2="https://repo.greenhorn.local/repository/raw/serverjre-9-ea+${BUILD}_linux-x64-musl_bin.tar.gz" && \
	# select local URL if available
	{ URL="$URL1" && curl -sk --head --fail "$URL2" && URL="$URL2" || URL="$URL1"; } && \
	mkdir -p ${JAVA_HOME} && \
	# download and install
	echo "GET $URL" && \
	curl -jkL --fail "$URL" | tar xz --strip-components=1 -C ${JAVA_HOME}/ && \
	chown -R root:root ${JAVA_HOME} && \
	# cacerts
	rm -f ${JAVA_HOME}/lib/security/cacerts && \
	ln -s /etc/ssl/certs/java/cacerts ${JAVA_HOME}/lib/security/cacerts && \
	# OS update && cleanup
	apk del curl && \
	apk --no-cache --update upgrade && \
	rm -rf /var/cache/apk/* /var/log/* /tmp/*

LABEL OS_UPDATE="20171003"
RUN apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/*

ENTRYPOINT ["java"]
CMD ["-version"]

