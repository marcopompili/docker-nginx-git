# docker-nginx-git

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
    # if you want to use a custom configuration
    - ./default.conf:/etc/nginx/conf.d/default.conf
```
