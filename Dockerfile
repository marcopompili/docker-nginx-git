FROM phusion/baseimage

MAINTAINER Marco Pompili "marco.pompili@emarcs.org"

RUN apt-get -q -q update && \
    apt-get -y install nginx fcgiwrap git

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd nginx

RUN mkdir /srv/git

VOLUME ["/srv/git", "/var/log/nginx"]

COPY default.conf /etc/nginx/conf.d/

COPY gitconfig /etc/

COPY nginx.conf /etc/nginx/

COPY 99_start.sh /etc/my_init.d/
