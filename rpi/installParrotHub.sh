#!/bin/bash

# this script installs parrot hub and dependecies
# it should be run as root or sudo

# install openjdk 11
sudo apt install openjdk-11-jdk-headless


# create new user
sudo adduser parrot-hub
sudo adduser parrot-hub dialout


# create directory for running hub software
sudo mkdir /opt/parrot-hub
sudo chown parrot-hub.parrot-hub /opt/parrot-hub


# Download latest version of parrot hub
cd /tmp
parrotHubZipLocation=`curl -sL https://api.github.com/repos/parrot-ha/hub/releases/latest | grep -o "/parrot.*parrot-hub-.*\.zip"`
curl -L -O --remote-name https://github.com/${parrotHubZipLocation}
parrotHubZipName=${parrotHubZipLocation##/*/}
sudo unzip $parrotHubZipName -d /opt/parrot-hub/
parrotHubDirectory=${parrotHubZipName%.zip}
sudo ln -sf /opt/parrot-hub/$parrotHubDirectory /opt/parrot-hub/current-parrot-hub
sudo chown -R parrot-hub.parrot-hub /opt/parrot-hub


# create service to run parrot hub at boot
curl -L -O --remote-name https://raw.githubusercontent.com/parrot-ha/scripts/main/rpi/parrot-hub.service
sudo cp parrot-hub.service /lib/systemd/system/parrot-hub.service
sudo systemctl enable parrot-hub.service
sudo systemctl start parrot-hub.service
