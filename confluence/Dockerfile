FROM cptactionhank/atlassian-confluence:6.0.6
USER root
ADD /fixup.sh /
RUN /fixup.sh && rm /fixup.sh
USER daemon
