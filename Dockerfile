FROM jenkins/jenkins:lts


# limit Jenkins memory usage to Heroku free limits
ENV JAVA_OPTS -Xms256m -Xmx512m


# tini: https://github.com/krallin/tini#subreaping
# POST: Heroku chooses a random port to hang the container on,
# we have to retrieve it from env var and pass into config
CMD /sbin/tini -s -- /usr/local/bin/jenkins.sh --httpPort=$PORT