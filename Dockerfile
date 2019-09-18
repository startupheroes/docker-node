FROM openjdk:13-jdk

RUN yum update -y && \
  yum install -y multiarch-support libxml2-utils build-essential git curl tar gzip libjpeg-dev imagemagick ttf-dejavu jpegoptim grep libpng-dev && \
  mkdir -p ~/.m2

RUN curl -sL https://rpm.nodesource.com/setup_9.x | bash - 

RUN yum install -y nodejs

RUN curl -L -o /tmp/docker-17.03.0-ce.tgz https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz && \
  tar -xz -C /tmp -f /tmp/docker-17.03.0-ce.tgz && mv /tmp/docker/* /usr/bin
