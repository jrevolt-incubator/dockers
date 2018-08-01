FROM cptactionhank/atlassian-jira-software:7.11.1
LABEL BUILD="20180730"
USER root
ADD /fixup.sh /
RUN /fixup.sh && rm /fixup.sh
USER daemon
