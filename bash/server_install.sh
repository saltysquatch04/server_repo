#!/bin/bash

# #making directories
cd /

# #media_server directories
# mkdir media_server
# mkdir /media_server/appdata
# mkdir /media_server/appdata/config
# mkdir /media_server/downloads
# mkdir /media_server/media
# mkdir /media_server/media/movies
# mkdir /media_server/media/tv

#mc directories
mkdir mc_server
mkdir /mc_server/data/mods
mkdir /mc_server/data/config

#create docker containers
cd ~
echo $(pwd)
# docker compose -f "server_repo/docker/portainer.yml" -f "server_repo/docker/media_server.yml" up -d
docker compose -f "server_repo/docker/portainer.yml" up -d
docker compose -f "server_repo/docker/mc_server.yml" up -d

