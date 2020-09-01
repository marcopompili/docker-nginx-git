# docker-nginx-git

[![](https://img.shields.io/docker/v/emarcs/nginx-git.svg)](https://hub.docker.com/r/emarcs/nginx-git) [![](https://img.shields.io/docker/image-size/emarcs/nginx-git)](https://hub.docker.com/r/emarcs/nginx-git) ![Pulls](https://img.shields.io/docker/pulls/emarcs/nginx-git.svg)

Docker image for a Git HTTP server on Nginx.

This image is based on the [phusion/baseimage](https://github.com/phusion/baseimage-docker)
base image for solving the PID 1 problem of Docker and for other factors.

For more informations check these links:

*   [Docker and the PID 1 zombie reaping problem](https://blog.phusion.nl/2015/01/20/docker-and-the-pid-1-zombie-reaping-problem/)

*   [Baseimage-docker](http://phusion.github.io/baseimage-docker/)
the base image used in this image.

## Installation

Download the image from the docker's hub:

```shell
docker pull emarcs/nginx-git
```

## Usage

The simply run a container, remember to mount a volume from the host
with all your repositories, in the example the host folder __/git__
is mounted in the container at: __/srv/git__:

```shell
docker run -d -p 8180:80 -v /git:/srv/git emarcs/nginx-git
```

### Docker Compose

Here's an example using Docker Compose:

```yml
test_srv:
  image: emarcs/nginx-git
  ports:
    - 8180:80
  volumes:
    - /srv/git:/srv/git
    - logs:/var/log/nginx
    # add your custom username and password (default is: admin, admin)
    - ./htpasswd:/srv/htpasswd
    # if you want to use a custom configuration
    - ./default.conf:/etc/nginx/conf.d/default.conf
  environment:
    GIT_POSTBUFFER: 1048576
```

Test it:

```shell
git clone http://localhost:8180/myrepo.git
```

Default username and password are admin/admin. I strongly suggest you to update the htpasswd file with your password, like so:

```shell
htpasswd htpasswd admin
```
