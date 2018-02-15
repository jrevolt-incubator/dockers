FROM jrevolt/jre:8u162

RUN \
	BUILD_TOOLS="curl wget rsync" && \
	cd /tmp && \
	apk add --no-cache --update ca-certificates tar ${BUILD_TOOLS} && \
	# download JDK
	URL1="http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_HASH}/jdk-${JAVA_VERSION}-linux-x64.tar.gz" && \
	URL2="https://repo.greenhorn.local/repository/raw/jdk-${JAVA_VERSION}-linux-x64.tar.gz" && \
	COOKIE="Cookie: oraclelicense=accept-securebackup-cookie; " && \
	# select local URL if available
	{ curl -sk --head --fail "$URL2" && URL="$URL2" || URL="$URL1"; } && \
	# download and install
	curl -svjkL --fail -H "$COOKIE" "$URL" | tar xzv && rsync -rcvh /tmp/jdk*/ ${JAVA_HOME}/ && \
	# cacerts
	rm -f ${JAVA_HOME}/jre/lib/security/cacerts && \
	ln -s /etc/ssl/certs/java/cacerts ${JAVA_HOME}/jre/lib/security/cacerts && \
	# cleanup
	apk del ${BUILD_TOOLS} && \
	rm -rf /var/cache/apk/* /var/log/* /tmp/*

LABEL OS_UPDATE="20180215"
RUN apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/*

