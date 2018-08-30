#!/bin/bash

# check if already installed
if [ ! -f /opt/idoit ];
then
  # fix permissions for webroot
  chmod 645 /var/www
  chown -R www-data:www-data /var/www/html

  # install mysql due to /var/lib/mysql mount
  apt-get update
  apt-get install -y mariadb-client mariadb-server
  systemctl enable mariadb
  systemctl start mariadb

  # install idoit
  expect /idoit-install.exp
  if [ $? -eq 0 ];
  then
    touch /opt/idoit
  fi

  # install api module
  cd /var/www/html/admin
  php index.php -a installModule -f /idoit-api.zip

  # remove temp
  rm -rf /var/www/html/temp/*
fi

# generate api key
if [ ! -f /opt/idoit-api-key ];
then
  /create-api-key.sh
fi
