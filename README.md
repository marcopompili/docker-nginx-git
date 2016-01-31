# docker-nginx-git

Docker image for a git server on nginx

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
