#!/bin/bash

#making directories
cd /
mkdir media_server
mkdir /media_server/appdata
mkdir /media_server/appdata/config
mkdir /media_server/downloads
mkdir /media_server/media
mkdir /media_server/media/movies
mkdir /media_server/media/tv

#create docker containers
docker compose -f "home/aedan/server_repo/docker/media_server.yml" up

