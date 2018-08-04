FROM jrevolt/alpine as build
ARG VERSION
ARG URL="http://download.sonatype.com/nexus/3/nexus-${VERSION}-unix.tar.gz"
RUN apk add -U curl
RUN curl -sjkL "$URL" | tar xzv && mv nexus-${VERSION} nexus

FROM jrevolt/alpine

RUN \
	apk --no-cache --update --upgrade add openjdk8-jre && \
	addgroup -g 500 nexus && adduser -SD -h /var/lib/nexus -s /bin/sh -G nexus -u 500 nexus && \
	mkdir -p /opt && ln -s /var/lib/nexus/sonatype-work /opt/sonatype-work

USER nexus
VOLUME /var/lib/nexus
EXPOSE 8081
CMD ["/opt/nexus/bin/nexus", "run"]

COPY --from=build /nexus /opt/nexus
COPY --from=build --chown=nexus:nexus /sonatype-work /var/lib/nexus/sonatype-work

