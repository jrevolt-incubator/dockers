FROM jrevolt/jdk:8u111

ADD env.sh /

RUN apk --no-cache add bash libstdc++ git wget
RUN mkdir /var/lib/gradle

ENV GRADLE_HOME /opt/gradle
ENV PATH ${GRADLE_HOME}/bin:${PATH}

RUN \
   source /env.sh && \
   mkdir -p /opt && \
	wget -O /tmp/gradle.zip https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip && \
	cd /opt && unzip /tmp/gradle && \
	ln -s /opt/gradle-* /opt/gradle && \
	rm /var/cache/apk/* /tmp/gradle.zip

VOLUME /var/lib/gradle
WORKDIR /var/lib/gradle
ENTRYPOINT ["gradle"]
CMD ["--version"]


