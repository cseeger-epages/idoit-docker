# idoit-docker

idoit in a docker container

## a side note

Since this is a running version of the open source i-doit including its API, i build this container for API stability testing. **I do not recommend to use this docker container in production** as it is not maintained by synaptics and the container does not take care of any kind of update and migration policy. 

Use this container for demo or testing purposes.

However if you want to use it in a production state you have to take backups by yourself as idoit is configured without automatic backups. 
If you try to upgrade make sure you have backups. 
I dont know if the [install script](https://raw.githubusercontent.com/bheisig/i-doit-scripts/master/idoit-install) takes care of existing databases and migration from old versions to new versions.
It may break your stuff

## Features
- includes the api installation and configuration

## usage

The latest idoit version will be installed when the container starts the first time. Be patient this may take a while.

### docker

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

The generated API key can be found under `<opt-path>/idoit-api-key` (default is `/opt/idoit/opt/idoit-api-key`)

## docker-compse

## build

```
make build
```


tbd 
- expose ports
