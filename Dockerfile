From library/debian:latest

ENV container docker

Maintainer Carsten Seeger <cseeger@epages.com>

# install dependencys
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y apache2 libapache2-mod-php php php-bcmath php-cli php-common php-curl php-gd php-imagick php-json php-ldap php-mbstring php-mcrypt php-memcached php-mysql php-pgsql php-soap php-xml php-zip memcached unzip sudo moreutils \
    && apt-get install -y wget dialog systemd systemd-sysv expect curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN systemctl set-default multi-user.target
ENV init /lib/systemd/systemd

RUN wget https://raw.githubusercontent.com/bheisig/i-doit-scripts/master/idoit-install -O /idoit-install \
    && chmod 755 /idoit-install \
    && wget https://login.i-doit.com/downloads/idoit-api-1.8.zip -O /idoit-api.zip 

COPY ./install.sh /
COPY ./idoit-install.exp /
COPY ./create-api-key.sh /
COPY ./install.service /etc/systemd/system/

RUN systemctl enable install

VOLUME [ "sys/fs/cgroup" ]
ENTRYPOINT ["/lib/systemd/systemd"]
