FROM jrevolt/jdk

RUN mkdir /opt && apk add curl && \
	curl http://tux.rainside.sk/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar xzv -C /opt/ && \
	ln -s /opt/apache-maven-3.3.9 /opt/maven && \
	apk del curl && rm /var/cache/apk/*

ENV M2_HOME /opt/maven
ENV PATH ${M2_HOME}/bin:${PATH}


