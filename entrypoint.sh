#!/bin/bash

# check if already installed
if [ ! -f /opt/idoit ];
then
  # install idoit
  expect /idoit-install.exp
  touch /opt/idoit
fi
