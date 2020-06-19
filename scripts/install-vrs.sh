#!/usr/bin/env bash
set -euo pipefail

cd /tmp

apt-get update
apt-get install -y --no-install-recommends awscli
apt-get clean

for FILENAME in VirtualRadar.tar.gz VirtualRadar.WebAdminPlugin.tar.gz VirtualRadar.exe.config.tar.gz VirtualRadar.DatabaseWriterPlugin.tar.gz VirtualRadar.CustomContentPlugin.tar.gz; do
    echo "Downloading File: $FILENAME"
    curl -o $FILENAME http://www.virtualradarserver.co.uk/Files/$FILENAME --silent
    tar -xf $FILENAME -C /opt/vrs/
done

