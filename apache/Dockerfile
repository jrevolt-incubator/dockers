FROM jrevolt/alpine

RUN apk --no-cache --update add apache2 && mkdir /run/apache2

ADD run.sh /run.sh

ENTRYPOINT ["/run.sh"]

