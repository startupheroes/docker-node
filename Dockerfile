FROM openjdk:15-jdk-alpine

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

RUN  mkdir -p /opt/ortools && wget -qO-  https://github.com/google/or-tools/releases/download/v8.1/or-tools_alpine-edge_v8.1.8487.tar.gz | tar xvz -C /opt/ortools/ --strip-components=1

RUN apk update && \
    apk add --no-cache docker-cli \
                       git \
                       nodejs \
                       npm \
                       coreutils \
                       openssh \
                       python3 \
                       py3-pip \
                       groff \
                       gcompat \
                       tzdata \
                       imagemagick \
                       ttf-dejavu \
                       gettext \
                       curl && \
    pip install --upgrade awscli==1.18.51  && \
    cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    echo "Europe/Moscow" > /etc/timezone && \
    apk --purge del tzdata py-pip
