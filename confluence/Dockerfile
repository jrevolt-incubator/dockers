FROM cptactionhank/atlassian-confluence:6.10.1
USER root
ADD /fixup.sh /
RUN /fixup.sh && rm /fixup.sh
USER daemon
