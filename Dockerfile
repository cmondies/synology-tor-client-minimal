FROM alpine:edge
RUN apk update
# Alpine Linux package management : http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
# http://dl-4.alpinelinux.org/alpine/edge/testing/x86_64/
RUN apk add tor --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

EXPOSE 9150

RUN rm /var/cache/apk/*
RUN mkdir /var/lib/tor

ADD ./torrc /etc/tor/torrc
# Allow you to upgrade your relay without having to regenerate keys
VOLUME /root/.tor

# Generate a random nickname for the relay
RUN echo "Nickname docker$(head -c 16 /dev/urandom  | sha1sum | cut -c1-10)" >> /etc/tor/torrc

CMD /usr/bin/tor -f /etc/tor/torrc
