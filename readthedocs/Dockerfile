FROM jrevolt/alpine:3.6.2
ADD run.sh /run.sh
RUN chmod a+x /run.sh
RUN apk update -U && apk add bash py-pip make && rm -rf /var/cache/apk/* /var/log/* /tmp/*
RUN pip install --upgrade pip
RUN pip install sphinx sphinx-autobuild sphinx_rtd_theme

VOLUME ["/source"]
VOLUME ["/build"]

ENTRYPOINT ["/run.sh"]
