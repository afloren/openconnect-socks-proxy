#
# Dockerfile for openconnect
#

FROM alpine:edge

RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               openconnect \
	       openssh \
    && sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config \
    && mkdir -p /etc/openconnect \
    && touch /etc/openconnect/openconnect.conf

ADD entrypoint.sh /entrypoint.sh

ADD openconnect.conf /openconnect.conf

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh", "--config=/openconnect.conf"]
CMD ["--help"]
