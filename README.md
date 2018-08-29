# idoit-docker

idoit in a docker container

## in Development do not use yet 

```
docker run -d \
  --name=idoit \
  --cap-add=SYS_ADMIN \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --tmpfs /run \
  --tmpfs /run/lock \
  idoit
```

tbd 
- volume mounts for webroot + mysql
- expect script
- expose ports
- api installation

