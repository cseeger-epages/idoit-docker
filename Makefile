build:
	docker build -t cseeger4epages/idoit-docker .

rebuild:
	docker pull library/debian
	docker build --no-cache=true -t cseeger4epages/idoit-docker .

push:
	#docker tag cseeger4epages/idoit-docker cseeger4epages/idoit-docker:$$(date +%Y%m%d) 
	#docker push cseeger4epages/idoit-docker
	docker tag cseeger4epages/idoit-docker cseeger4epages/idoit-docker:latest
	docker push cseeger4epages/idoit-docker

run:
	mkdir -p /tmp/idoit/{,html,mysql,opt}
	docker run -d --name=idoit --cap-add=SYS_ADMIN --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp/idoit/opt:/opt:rw -v /tmp/idoit/mysql:/var/lib/mysql:rw -v /tmp/idoit/html:/var/www/html:rw cseeger4epages/idoit-docker

exec:
	docker exec -it idoit bash

log: 
	docker logs -f idoit

clean:
	docker kill idoit
	docker rm idoit
	sudo rm -rf /tmp/idoit
