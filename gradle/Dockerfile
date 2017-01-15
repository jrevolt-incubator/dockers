FROM jrevolt/jdk

RUN mkdir -p /opt && \
	apk update && \
	apk add wget && \
	wget -O /tmp/gradle.zip https://services.gradle.org/distributions/gradle-3.2-bin.zip && \
	cd /opt && unzip /tmp/gradle && \
	ln -s /opt/gradle-* /opt/gradle && \
	apk del wget && rm /var/cache/apk/* /tmp/gradle.zip

RUN apk --no-cache add bash libstdc++
RUN mkdir /var/lib/gradle
RUN apk --no-cache add git

ENV GRADLE_HOME /opt/gradle
ENV PATH ${GRADLE_HOME}/bin:${PATH}

VOLUME /var/lib/gradle
WORKDIR /var/lib/gradle
ENTRYPOINT ["gradle"]
CMD ["--version"]


