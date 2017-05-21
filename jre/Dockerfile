FROM jrevolt/alpine:3.5.2

ENV JAVA_HOME="/opt/java"
ENV PATH="${JAVA_HOME}/bin:${PATH}"
ENV JAVA_VERSION="8u131"
ENV JAVA_BUILD="${JAVA_VERSION}-b11"
ENV JAVA_HASH="d54c1d3a095b4ff2b6607d096fa80163"
ENV GLIBC_VERSION="2.25-r0"

RUN \
	cd /tmp && \
	apk add --update curl && \
	# glibc
	BASEURL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download" && \
	for i in glibc{,-bin,-i18n}; do \
		curl -k -OJL ${BASEURL}/${GLIBC_VERSION}/${i}-${GLIBC_VERSION}.apk; \
	done && \
	apk --allow-untrusted add *.apk && \
	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
	rm -rf /var/cache/apk/* /var/log/* /tmp/*
	
RUN \
	cd /tmp && \
	# oracle server JRE
	URL1="http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_HASH}/server-jre-${JAVA_VERSION}-linux-x64.tar.gz" && \
	URL2="https://repo.greenhorn.local/repository/raw/server-jre-${JAVA_VERSION}-linux-x64.tar.gz" && \
	JCEURL="http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
	COOKIE="Cookie: oraclelicense=accept-securebackup-cookie; " && \
	# select local URL if available
	{ URL="$URL1" && curl -sk --head --fail "$URL2" && URL="$URL2"; } && \
	mkdir -p ${JAVA_HOME} && \
	# download and install
	echo "GET $URL" && \
	curl -jkL --fail -H "$COOKIE" "$URL" | tar xz --strip-components=1 -C ${JAVA_HOME}/ && \
	# JCE
	echo "GET $JCEURL" && \
	curl -jkL -H "$COOKIE" "$JCEURL" > jce.zip && unzip jce.zip && mv UnlimitedJCEPolicy*/* ${JAVA_HOME}/jre/lib/security/ && \
	chown -R root:root ${JAVA_HOME} && \
	# cacerts
	apk add --update ca-certificates java-cacerts && \
	rm -f ${JAVA_HOME}/jre/lib/security/cacerts && \
	ln -s /etc/ssl/certs/java/cacerts ${JAVA_HOME}/jre/lib/security/cacerts && \
	# cleanup
	rm -rf jce.zip UnlimitedJCEPolicy* && \
	apk del curl wget && \
	rm -rf /var/cache/apk/* /var/log/* /tmp/*

LABEL OS_UPDATE="20170224"
RUN apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/*

ENTRYPOINT ["java"]
CMD ["-version"]

