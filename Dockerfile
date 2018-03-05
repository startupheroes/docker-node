FROM openjdk:9-jdk

RUN apt-get update && \
  apt-get install -y multiarch-support libxml2-utils build-essential git curl tar gzip libjpeg-dev imagemagick ttf-dejavu jpegoptim grep libpng-dev --no-install-recommends && \
  mkdir -p ~/.m2

RUN wget -q -O /tmp/libpng12.deb http://ftp.tr.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.49-1+deb7u2_amd64.deb \
  && dpkg -i /tmp/libpng12.deb \
  && rm /tmp/libpng12.deb

RUN curl --silent --show-error --location --fail --retry 3 --output /etc/ssl/certs/java/cacerts \ 
    https://circle-downloads.s3.amazonaws.com/circleci-images/cache/linux-amd64/openjdk-9-slim-cacerts

RUN curl -L -o /tmp/docker-17.03.0-ce.tgz https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz && \
  tar -xz -C /tmp -f /tmp/docker-17.03.0-ce.tgz && mv /tmp/docker/* /usr/bin
