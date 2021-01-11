FROM nginx:stable-alpine

LABEL maintainer="Marco Pompili"
LABEL email="docker@mg.odd.red"

RUN apk add --update --no-cache dumb-init spawn-fcgi fcgiwrap git

RUN mkdir /srv/git

VOLUME ["/srv/git", "/var/log/nginx"]

COPY default.conf /etc/nginx/conf.d/
COPY gitconfig.template /etc/
COPY nginx.conf /etc/nginx/

RUN sed -i '35iserver_tokens off;' /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/

ENV GIT_POSTBUFFER 1048576

COPY init.sh /sbin

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/sbin/init.sh"]
