From library/debian:latest

ENV container docker

Maintainer Carsten Seeger <cseeger@epages.com>

# install dependencys
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y apache2 mariadb-server php7.0 wget dialog systemd systemd-sysv expect \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN systemctl set-default multi-user.target
ENV init /lib/systemd/systemd

RUN wget https://raw.githubusercontent.com/bheisig/i-doit-scripts/master/idoit-install -O /idoit-install \
    && chmod 755 /idoit-install \
    && wget https://login.i-doit.com/downloads/idoit-api-1.8.zip -O /idoit-api.zip 

COPY ./entrypoint.sh /
COPY ./idoit-install.exp /
COPY ./install.service /etc/systemd/system/

RUN systemctl enable install

VOLUME [ "sys/fs/cgroup" ]
ENTRYPOINT ["/lib/systemd/systemd"]
