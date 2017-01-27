FROM jrevolt/alpine

ENV JAVA_HOME="/opt/java"
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN \
	# params
	JAVA_VERSION="8u121" && \
   JAVA_BUILD="${JAVA_VERSION}-b13" && \
   JAVA_HASH="e9e7ea248e2c4826b92b3f075a80e441" && \
   GLIBC_VERSION="2.23-r3" && \
	# glibc
	apk add --update curl wget ca-certificates && \
	cd /tmp && \
	BASEURL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download" && \
	wget ${BASEURL}/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
   wget ${BASEURL}/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
	wget ${BASEURL}/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk && \
	apk --allow-untrusted add *.apk && rm -f *apk && \
	/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
	# oracle server JRE
	apk add --update ca-certificates java-cacerts && \
	mkdir -p /opt && \
	URL="http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_HASH}/server-jre-${JAVA_VERSION}-linux-x64.tar.gz" && \
	JCEURL="http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
	COOKIE="Cookie: oraclelicense=accept-securebackup-cookie; " && \
	curl -svjkL --fail -H "$COOKIE" "$URL" | tar xzv -C /opt && \
	mv /opt/jdk* ${JAVA_HOME} && \
	curl -sjkL -H "$COOKIE" "$JCEURL" > jce.zip && unzip jce.zip ** mv UnlimitedJCEPolicy*/* ${JAVA_HOME}/jre/lib/security/ && \
	chown -R root:root ${JAVA_HOME} && \
	# cacerts
	rm -f ${JAVA_HOME}/jre/lib/security/cacerts && \
	ln -s /etc/ssl/certs/java/cacerts ${JAVA_HOME}/jre/lib/security/cacerts && \
	# cleanup
	rm -rf jce.zip UnlimitedJCEPolicy* && \
	apk del curl wget && \
	rm -rf /var/cache/apk/* /var/log/* /tmp/*

ENTRYPOINT ["java"]
CMD ["-version"]

