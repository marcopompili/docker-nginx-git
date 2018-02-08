#!/bin/sh

GIT_VARS='$GIT_POSTBUFFER'

envsubst "$GIT_VARS" < /etc/gitconfig.template > /etc/gitconfig

spawn-fcgi -M 666 -s /var/run/fcgiwrap.socket /usr/sbin/fcgiwrap

nginx -g "daemon off;"
