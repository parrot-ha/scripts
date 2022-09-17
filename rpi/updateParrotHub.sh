#!/bin/bash

# this script updates parrot hub and dependecies
# it should be run as parrot-hub user

# Download latest version of parrot hub
cd /tmp
parrotHubZipLocation=`curl -sL https://api.github.com/repos/parrot-ha/hub/releases/latest | grep -o "/parrot.*parrot-hub-.*\.zip"`
curl -L -O --remote-name https://github.com/${parrotHubZipLocation}
parrotHubZipName=${parrotHubZipLocation##/*/}

sudo systemctl stop parrot-hub.service

unzip $parrotHubZipName -d /opt/parrot-hub/
parrotHubDirectory=${parrotHubZipName%.zip}
rm /opt/parrot-hub/current-parrot-hub
ln -sf /opt/parrot-hub/$parrotHubDirectory /opt/parrot-hub/current-parrot-hub

sudo systemctl start parrot-hub.service
