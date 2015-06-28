FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add bash python
# Alpine Linux package testing : http://dl-4.alpinelinux.org/alpine/edge/testing/x86_64/
RUN apk add tor --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

ADD ./arm-1.4.5.0.tar.gz /tmp/arm-1.4.5.0.tar.gz

RUN cd /tmp/ && tar xvf arm-1.4.5.0.tar.gz
RUN cd /tmp/arm-1.4.5.0 && ./install


RUN rm /var/cache/apk/*

EXPOSE 9150

RUN rm /var/cache/apk/*

ADD ./torrc /etc/tor/torrc

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
