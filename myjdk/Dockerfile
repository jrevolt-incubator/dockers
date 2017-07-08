FROM jrevolt/jre:8u121

RUN \
	BUILD_TOOLS="curl wget rsync" && \
	cd /tmp && \
	apk add --no-cache --update ca-certificates tar ${BUILD_TOOLS} && \
	URL="http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_HASH}/jdk-${JAVA_VERSION}-linux-x64.tar.gz" && \
	JCEURL="http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
	COOKIE="Cookie: oraclelicense=accept-securebackup-cookie; " && \
	#curl -svjkL --fail -H "$COOKIE" "$URL" | tar xzv --skip-old-files --strip-components=1 -C ${JAVA_HOME}/ && du -m -d2 ${JAVA_HOME} && \
	curl -svjkL --fail -H "$COOKIE" "$URL" | tar xzv && rsync -rcvh --delete /tmp/jdk*/ ${JAVA_HOME}/ && \
	du -m -d2 ${JAVA_HOME} && \
	# cacerts
	rm -f ${JAVA_HOME}/jre/lib/security/cacerts && \
	ln -s /etc/ssl/certs/java/cacerts ${JAVA_HOME}/jre/lib/security/cacerts && \
	# cleanup
	apk del ${BUILD_TOOLS} && \
	rm -rf /var/cache/apk/* /var/log/* /tmp/*

LABEL OS_UPDATE=20170223
RUN apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/*

ENTRYPOINT ["java"]
CMD ["-version"]

