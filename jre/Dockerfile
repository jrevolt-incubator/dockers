FROM jrevolt/alpine:3.7.0

ENV JAVA_HOME="/opt/java"
ENV PATH="${JAVA_HOME}/bin:${PATH}"
ENV JAVA_VERSION="8u162"
ENV JAVA_BUILD="${JAVA_VERSION}-b12"
ENV JAVA_HASH="0da788060d494f5095bf8624735fa2f1"
ENV GLIBC_VERSION="2.26-r0"

#http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jre-8u152-linux-x64.tar.gz
#http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jre-8u161-linux-x64.tar.gz
#http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jre-8u162-linux-x64.tar.gz

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
	{ curl -sk --head --fail "$URL2" && URL="$URL2" || URL="$URL1"; } && \
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

LABEL OS_UPDATE="20170802"
RUN apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/*

ENTRYPOINT ["java"]
CMD ["-version"]

