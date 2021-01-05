FROM adoptopenjdk/openjdk15:alpine-slim

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

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
                       tzdata \
                       imagemagick \
                       ttf-dejavu \
                       gettext \
                       curl && \
    pip install --upgrade awscli==1.18.51  && \
    cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    echo "Europe/Moscow" > /etc/timezone && \
    apk --purge del tzdata py-pip