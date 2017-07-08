FROM jrevolt/jre

LABEL rebuild="2"

RUN apk --no-cache --update add bash curl git sudo

ARG APPNAME="jrevolt"
ARG HOMEDIR="/opt/${APPNAME}"
ARG BINDIR="/usr/local/bin"
ARG SCRIPT="${BINDIR}/jrevolt.sh"
ARG JAR="${BINDIR}/io.jrevolt.launcher-${VERSION}.jar"

RUN \
	mkdir -p ${HOMEDIR} && \
	addgroup jrevolt && adduser -S -D -h ${HOMEDIR} -s /bin/bash jrevolt jrevolt && \
	chown jrevolt:jrevolt ${HOMEDIR}

RUN \
	curl -sL https://goo.gl/yy2UxF | sudo -u jrevolt bash -ls install develop && \
	apk del curl git sudo

ENV HOME="${HOMEDIR}"
ENV PATH="${HOMEDIR}/.jrevolt:$PATH"

VOLUME ["${HOME}/.jrevolt"]
ENTRYPOINT ["jrevolt.sh"]


