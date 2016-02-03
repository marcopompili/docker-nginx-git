FROM nginx

MAINTAINER Marco Pompili "marco.pompili@emarcs.org"

RUN apt-get update && \
    apt-get -q -y install fcgiwrap git cgit

RUN mkdir /srv/git

COPY default.conf /etc/nginx/conf.d/

COPY gitconfig /etc/

COPY nginx.conf /etc/nginx/

COPY entrypoint.sh /usr/local/bin/

VOLUME ["/srv/git"]

ENTRYPOINT ["entrypoint.sh"]
