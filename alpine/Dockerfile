FROM alpine
LABEL OS_UPDATE="20171116"
RUN \
	apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/* && \
	cat /etc/*release*
