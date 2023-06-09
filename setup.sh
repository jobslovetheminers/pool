#!/bin/bash

# install install-dependencies
 apt-get update; \
   apt-get -y install wget

# add dotnet repo
 wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
 dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# install dev-dependencies
 apt-get update; \
 apt-get -y install dotnet-sdk-6.0 git cmake build-essential libssl-dev pkg-config libboost-all-dev libsodium-dev libzmq5-dev

(cd src/Miningcore && \
BUILDIR=${1:-../../build} && \
echo "Building into $BUILDIR" && \
dotnet publish -c Release --framework net6.0 -o $BUILDIR)