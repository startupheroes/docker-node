FROM node:6.10.3-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh tar gzip
