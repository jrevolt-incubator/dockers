FROM jrevolt/jdk

RUN mkdir -p /opt && apk add wget && \
	wget -O /tmp/gradle.zip https://services.gradle.org/distributions/gradle-2.11-bin.zip && \
	cd /opt && unzip /tmp/gradle && \
	ln -s /opt/gradle-2.11 /opt/gradle && \
	apk del wget && rm /var/cache/apk/* /tmp/gradle.zip

RUN apk --no-cache add bash libstdc++

ENV GRADLE_HOME /opt/gradle
ENV PATH ${GRADLE_HOME}/bin:${PATH}

