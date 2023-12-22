#!/bin/bash

#moving to root
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
mkdir mc_server/data
# mkdir /mc_server/data/mods
# mkdir /mc_server/data/config

#create docker containers
# docker volume create portainer_data
# docker run -d -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
# # docker compose -f "/home/aedan/server_repo/docker/media_server.yml" up -d
docker compose -f "/home/aedan/server_repo/docker/mc_server.yml" up -d

if [ "$( docker ps | grep mc | awk '{print $7}' )" != "Up" ];
then
    echo true
fi

# while [ "$( docker ps | grep mc | awk '{print $7}' )" != "Up" ];
# do 
#     echo "mc $( docker ps | grep mc | awk '{print $7}' )"
# done

#copying mods to correct directory
# cp /home/aedan/server_repo/mods/* /mc_server/data/mods