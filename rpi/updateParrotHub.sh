#!/bin/bash

# this script updates parrot hub and dependecies
# it should be run as parrot-hub user

# Download latest version of parrot hub
cd /tmp
parrotHubZipLocation=`curl -sL https://github.com/parrot-ha/hub/releases/latest | grep -o "/parrot.*parrot-hub-.*\.zip"`
curl -L -O --remote-name https://github.com/${parrotHubZipLocation}
parrotHubZipName=${parrotHubZipLocation##/*/}

systemctl stop parrot-hub.service

unzip $parrotHubZipName -d /opt/parrot-hub/
parrotHubDirectory=${parrotHubZipName%.zip}
echo $parrotHubDirectory
ln -sf /opt/parrot-hub/$parrotHubDirectory /opt/parrot-hub/current-parrot-hub

systemctl start parrot-hub.service
