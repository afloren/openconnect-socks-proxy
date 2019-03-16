#
# Dockerfile for openconnect
#

FROM alpine:edge

RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               automake \
               autoconf \
               build-base \
               libevent-dev \
               linux-headers \
               openconnect \
    && wget https://github.com/cernekee/ocproxy/archive/v1.60.tar.gz -O ocproxy-v1.60.tar.gz \
    && tar xzf ocproxy-v1.60.tar.gz \
    && cd ocproxy-1.60 \
    && autoreconf --install \
    && ./configure \
    && make install

ADD openconnect.conf.template /etc/openconnect/openconnect.conf
VOLUME /etc/openconnect

EXPOSE 1080

ENTRYPOINT ["openconnect",  "--script-tun", "--script=ocproxy -g -D 1080", "--config=/etc/openconnect/openconnect.conf"]
CMD ["--help"]
