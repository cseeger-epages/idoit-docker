all:
	docker build -t cseeger-epages/idoit-docker .

rebuild:
	docker pull library/debian
	docker build --no-cache=true -t cseeger-epages/idoit-docker .

push:
	docker tag cseeger-epages/idoit-docker cseeger-epages/idoit-docker:$$(date +%Y%m%d) 
	docker push cseeger-epages/idoit-docker

run:
	docker run -d --name=idoit --cap-add=SYS_ADMIN --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro cseeger-epages/idoit-docker

exec:
	docker exec -it idoit bash

clean:
	docker kill idoit
	docker rm idoit
