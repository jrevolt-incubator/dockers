FROM jrevolt/jdk:8u162

ADD env.sh /

RUN apk --no-cache add bash libstdc++ git wget gnupg
RUN mkdir /var/lib/gradle

ENV GRADLE_HOME /opt/gradle
ENV PATH ${GRADLE_HOME}/bin:${PATH}

RUN \
   source /env.sh && \
   mkdir -p /opt && \
	wget -O /tmp/gradle.zip https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip && \
	cd /opt && unzip /tmp/gradle && \
	ln -s /opt/gradle-* /opt/gradle && \
	rm -rf /var/cache/apk/* /tmp/gradle.zip

LABEL OS_UPDATE="20180215"
RUN apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/*

VOLUME /var/lib/gradle
WORKDIR /var/lib/gradle
ENTRYPOINT ["gradle"]
CMD ["--version"]


