FROM debian:stable-slim

#http://download.oracle.com/otn-pub/java/jdk/10+46/76eac37278c24557a3c4199677f19b62/jre-10_linux-x64_bin.tar.gz

RUN \
	JAVA_RELEASE="10" ;\
	JAVA_VERSION="${JAVA_RELEASE}+46" ;\
	JAVA_HASH="76eac37278c24557a3c4199677f19b62" ;\
	FILE_NAME="serverjre-${JAVA_RELEASE}_linux-x64_bin.tar.gz" ;\
	URL="http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}/${JAVA_HASH}/${FILE_NAME}" ;\
	COOKIE="Cookie: oraclelicense=accept-securebackup-cookie; " ;\
	JAVA_HOME=/opt/java ;\
	#
	apt-get update && apt-get install -y --no-install-recommends curl &&\
	#
	echo "GET $URL" && \
	mkdir -p ${JAVA_HOME} && cd ${JAVA_HOME} &&\
	curl -sjkL --fail -H "$COOKIE" "$URL" | tar xz --strip-components=1 &&\
	du -sch *

ENV JAVA_HOME=/opt/java PATH=/opt/java/bin:${PATH}
