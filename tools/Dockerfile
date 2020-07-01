FROM alpine:3.12

ARG http_proxy

RUN apk --no-cache add bash

COPY ./update-config.sh /usr/bin/

RUN chmod +x /usr/bin/update-config.sh

ENV http_proxy=""
