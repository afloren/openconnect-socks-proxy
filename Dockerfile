#
# Dockerfile for openconnect-socks-proxy service
#

# image to build ocproxy binary
FROM alpine:edge AS ocproxy-builder
RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               automake \
               autoconf \
               build-base \
               libevent-dev \
               linux-headers \
    && mkdir -p /usr/local/src \
    && wget -qO- https://github.com/cernekee/ocproxy/archive/v1.60.tar.gz \
    | tar vxz -C /usr/local/src
RUN set -xe \
    && cd /usr/local/src/ocproxy-1.60 \
    && autoreconf --install \
    && ./configure \
    && make

# service image
FROM alpine:edge
RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               libevent \
               openconnect
COPY --from=ocproxy-builder /usr/local/src/ocproxy-1.60/ocproxy /usr/local/bin/ocproxy
COPY openconnect.conf /etc/openconnect.conf
EXPOSE 1080
ENTRYPOINT ["openconnect",  "--script-tun", "--script=ocproxy -g -D 1080", "--config=/etc/openconnect.conf"]
CMD ["--help"]
