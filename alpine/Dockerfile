FROM alpine:3.6
LABEL OS_UPDATE="20170708"
RUN \
	apk --no-cache --update upgrade && rm -rf /var/cache/apk/* /var/log/* /tmp/* && \
	cat /etc/*release*
