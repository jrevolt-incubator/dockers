FROM jrevolt/alpine

RUN apk --no-cache --update add openjdk8-jre

ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre

ENTRYPOINT ["java"]
CMD ["-version"]

