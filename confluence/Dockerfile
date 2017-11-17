FROM cptactionhank/atlassian-confluence:6.3.4
USER root
ADD /fixup.sh /
RUN /fixup.sh && rm /fixup.sh
USER daemon
