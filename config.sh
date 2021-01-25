#!/bin/sh

GIT_VARS='$GIT_POSTBUFFER'

envsubst "$GIT_VARS" < /etc/gitconfig.template > /etc/gitconfig