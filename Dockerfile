FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add bash python
# Alpine Linux package testing : http://dl-4.alpinelinux.org/alpine/edge/testing/x86_64/
RUN apk add tor --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# install arm https://www.atagar.com/arm/
RUN curl https://www.atagar.com/arm/resources/static/arm-1.4.5.0.tar.bz2 | tar xvjf -C /tmp

EXPOSE 9150

RUN rm /var/cache/apk/*

ADD ./torrc /etc/tor/torrc

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc
