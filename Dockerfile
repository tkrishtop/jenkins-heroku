FROM jenkins/jenkins:lts


# limit Jenkins memory usage to Heroku free limits
ENV JAVA_OPTS -Xms256m -Xmx512m


# setup Jenkins user and password

#ARG JENKINS_USER=admin
#ENV ENV_JENKINS_USER=$JENKINS_USER

#ARG JENKINS_PASSWORD
#ENV ENV_JENKINS_PASSWORD=$JENKINS_PASSWORD

#ENV JENKINS_OPTS \
#--argumentsRealm.roles.user=$ENV_JENKINS_USER \
#--argumentsRealm.passwd.admin=$ENV_JENKINS_PASSWORD \
#--argumentsRealm.roles.admin=$ENV_JENKINS_USER


# tini: https://github.com/krallin/tini#subreaping
# POST: Heroku chooses a random port to hang the container on,
# we have to retrieve it from env var and pass into config
CMD /sbin/tini -s -- /usr/local/bin/jenkins.sh --httpPort=$PORT # -Djenkins.install.runSetupWizard=false