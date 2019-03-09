#!/bin/sh

ssh-keygen -A
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

/usr/sbin/sshd
ssh-keyscan -H localhost >> ~/.ssh/known_hosts
ssh -g -f -N -D 1080 localhost

openconnect "$@"



