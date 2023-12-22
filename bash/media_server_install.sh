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


echo $(pwd)
#create docker containers
docker compose -f "media_server.yml" up

