#!/bin/bash

rm -r /mc_server
rm -r /media_server

docker stop portainer mc prowlarr radarr sonarr qbittorrent emby
docker rm portainer mc prowlarr radarr sonarr qbittorrent emby