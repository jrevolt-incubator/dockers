FROM jrevolt/jre

ARG VERSION="0.2.1"
ARG URL="http://repo.jrevolt.io/content/groups/public/io/jrevolt/launcher/io.jrevolt.launcher/${VERSION}/io.jrevolt.launcher-${VERSION}.jar"

RUN apk --no-cache --update add bash curl
RUN \
	curl -sk -o /jrevolt.sh https://raw.githubusercontent.com/jrevolt/io.jrevolt.launcher/dist/jrevolt.sh && \
	chmod a+x /jrevolt.sh && \
	curl -sk -o /io.jrevolt.launcher.jar ${URL} && \
	apk --purge del git curl
RUN mkdir -p /root/.jrevolt

VOLUME ["${HOME}/.jrevolt"]

ENV JREVOLT_LAUNCHER_JAR="/io.jrevolt.launcher.jar"
ENTRYPOINT ["/jrevolt.sh"]


