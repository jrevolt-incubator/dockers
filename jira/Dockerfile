FROM cptactionhank/atlassian-jira-software:7.6.0
USER root
ADD /fixup.sh /
RUN /fixup.sh && rm /fixup.sh
USER daemon
