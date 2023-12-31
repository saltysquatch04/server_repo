#!/bin/bash

#intro
echo "          __            __        
   ____ _/ /___ _____  / /_  _____
  / __ \`/ / __ \`/ __ \/ __ \/ ___/
 / /_/ / / /_/ / /_/ / / / (__  ) 
 \__, /_/\__,_/ .___/_/ /_/____/  
/____/       /_/                  
    _            __        ____
   (_)___  _____/ /_____ _/ / /
  / / __ \/ ___/ __/ __ \`/ / / 
 / / / / (__  ) /_/ /_/ / / / 
/_/_/ /_/____/\__/\__,_/_/_/"

echo "============================================================
                         Starting...
============================================================"

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#moving to root
cd /

#media_server directories
mkdir media_server
mkdir /media_server/appdata
mkdir /media_server/appdata/config
mkdir /media_server/downloads
mkdir /media_server/media
mkdir /media_server/media/movies
mkdir /media_server/media/tv

#mc directories
mkdir mc_server
mkdir mc_server/data

#create docker containers
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
docker compose -f "/home/aedan/server_repo/docker/media_server.yml" up -d
docker compose -f "/home/aedan/server_repo/docker/mc_server.yml" up -d

#creating docker containers for filecloud
cd docker
docker compose -f "/home/aedan/server_repo/docker/filecloud.yml" up -d filecloud.server filecloud.mongodb

#allowing minecraft server to run to move mods over to cssorrect file location
echo "                         Waiting..."
for (( i=0; i < 60; i++)); do
    echo -n '='
    sleep 2
done

#copying mods to correct directory
cp /home/aedan/server_repo/mods/* /mc_server/data/mods

echo "============================================================
                       Setup Complete.
============================================================"
