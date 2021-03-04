FROM jenkins/jenkins:2.215

ENV CASC_JENKINS_CONFIG /jenkins_configs

USER root
RUN apt update && \
    apt install -y python3 python3-pip && \
    pip3 install awscli jenkins-job-builder jjb-reactive-choice-param --no-cache-dir

USER jenkins
VOLUME /jenkins_configs
VOLUME /var/jenkins_home

# COPY plugins.txt /usr/share/jenkins/ref/
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt