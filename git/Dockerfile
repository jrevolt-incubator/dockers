FROM jrevolt/alpine:3.6.2

RUN apk --no-cache add git && git --version

ENTRYPOINT ["/usr/bin/git"]
CMD ["--version"]
