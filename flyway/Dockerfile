FROM jrevolt/jre:8u121

ARG FLYWAY_VERSION="4.0.3"
ARG JTDS_VERSION="1.3.3"
ARG FLYWAY_DIST="http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz"
ARG JTDS_DIST="https://github.com/milesibastos/jTDS/releases/download/v${JTDS_VERSION}/jtds-${JTDS_VERSION}-dist.zip"

RUN apk --no-cache upgrade && apk add --update --no-cache bash wget ca-certificates
RUN wget -O - $FLYWAY_DIST | tar xzv && mv /flyway-* /flyway && ln -s /flyway/flyway /usr/local/bin/flyway
RUN wget -O jtds.zip $JTDS_DIST && mkdir jtds && cd jtds && unzip ../jtds.zip && \
    rm /flyway/drivers/jtds-*.jar && cp jtds-*.jar /flyway/drivers/ && \
    cd .. && rm -rf jtds.zip jtds

ARG JCIFS_VERSION="1.3.17"
ARG JCIFS_DIST="http://search.maven.org/remotecontent?filepath=jcifs/jcifs/${JCIFS_VERSION}/jcifs-${JCIFS_VERSION}.jar"
RUN wget -O /flyway/drivers/jcifs-${JCIFS_VERSION}.jar ${JCIFS_DIST}

RUN flyway 2>&1 | grep "Flyway $FLYWAY_VERSION"

WORKDIR /flyway
ENTRYPOINT ["flyway"]
CMD ["--help"]
