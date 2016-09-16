FROM jrevolt/alpine

RUN apk --no-cache --update add openjdk8-jre
RUN \
	apk add curl && \
	cd /usr/lib/jvm/default-jvm/jre/lib/security && \
	curl -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip > jce.zip && \
	unzip jce.zip && mv UnlimitedJCEPolicyJDK8/* ./ && \
	rm -rf jce.zip UnlimitedJCEPolicyJDK8 && apk del curl

ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre

ENTRYPOINT ["java"]
CMD ["-version"]

