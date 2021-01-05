#!/bin/sh

git clone https://github.com/docker/docker-install
cd docker-install

sh rootless-install.sh
# CHANNEL="test" sh rootless-install.sh

