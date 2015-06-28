FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add bash python
# Alpine Linux package testing : http://dl-4.alpinelinux.org/alpine/edge/testing/x86_64/
RUN apk add tor --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN rm /var/cache/apk/*

EXPOSE 9150

RUN rm /var/cache/apk/*

ADD ./torrc /etc/tor/torrc

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
