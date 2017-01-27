FROM jrevolt/alpine

RUN apk --no-cache --update add openjdk8

RUN apk --no-cache --update upgrade

ENV JAVA_HOME /usr/lib/jvm/default-jvm

ENTRYPOINT ["java"]
CMD ["-version"]
