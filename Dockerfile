#
# Dockerfile for openconnect
#

FROM alpine:edge

RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               openconnect \
	       openssh \
    && sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config

ADD entrypoint.sh /entrypoint.sh

ADD openconnect.conf.template /home/openconnect.conf

VOLUME /home

EXPOSE 1080

WORKDIR /home
ENTRYPOINT ["/entrypoint.sh", "--config=openconnect.conf"]
CMD ["--help"]
