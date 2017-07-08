FROM jenkinsci/jenkins:2.47-alpine
USER root
ADD /fixup.sh /
RUN /fixup.sh && rm /fixup.sh
USER jenkins
