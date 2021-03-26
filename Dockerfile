FROM jenkins/jenkins:lts

# limit Jenkins memory usage to Heroku free limits
ENV JAVA_OPTS -Xms256m -Xmx512m

# tini: https://github.com/krallin/tini#subreaping
# pass the port number into jenkins config
CMD /sbin/tini -s -- /usr/local/bin/jenkins.sh --httpPort=$PORT