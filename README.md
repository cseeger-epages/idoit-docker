# idoit-docker

[![dockerhub](https://img.shields.io/badge/dockerhub-reference-green.svg)](https://hub.docker.com/r/cseeger4epages/idoit-docker/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/cseeger-epages/idoit-docker/blob/master/LICENSE)

idoit in a docker container

## a side note

Since this is a running version of the open source i-doit including its API, i build this container for API stability testing. 

**I do not recommend to use this docker container in production** as it is not maintained by synaptics and the container does not take care of any kind of update and migration policy. 

Use this container for demo, developing or testing purposes.

## Features
- includes the api installation and configuration
- generated API key can be found under `<opt-path>/idoit-api-key` (default is `/opt/idoit/opt/idoit-api-key`)

## usage

The latest idoit version will be installed when the container starts the first time. Be patient this may take a while.

### docker

runs with systemd in unprivileged container using `--tmpfs` , `--cap-add=SYS_ADMIN` and `/sys/fs/cgroup` mount

```
docker run -d \
  --name=idoit \
  --cap-add=SYS_ADMIN \
  --tmpfs /run \
  --tmpfs /run/lock \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /opt/idoit/opt:/opt \
  -v /opt/idoit/mysql:/var/lib/mysql \
  -v /opt/idoit/html:/var/www/html \
  cseeger4epages/idoit-docker
```
## build

```
make build
make push
```

## testing and debugging

```
# start container
make run 
# get bash in container
make exec
```
