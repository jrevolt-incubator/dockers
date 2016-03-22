FROM buildpack-deps:curl

ADD vmware-ovftool-4.1.0-2459827-lin.x86_64.bundle /tmp/

RUN sh /tmp/vmware-ovftool-4.1.0-2459827-lin.x86_64.bundle -p /usr/local --eulas-agreed --required && \
	rm -f vmware-ovftool-4.1.0-2459827-lin.x86_64.bundle

ENTRYPOINT ["ovftool"]
CMD [ "--version" ]
