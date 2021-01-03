FROM openjdk:15-jdk-alpine

RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash -
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

RUN apk update && \
    apk add --no-cache docker-cli \
                       nodejs \
                       npm \
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