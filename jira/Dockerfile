FROM cptactionhank/atlassian-jira-software:7.3.1
USER root
ADD /fixup.sh /
RUN /fixup.sh && rm /fixup.sh
USER daemon
