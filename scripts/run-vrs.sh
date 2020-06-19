#!/usr/bin/env bash
set -euo pipefail

SOURCE=/config/source

mkdir -p $SOURCE

if [[ ! -f $SOURCE/admin_created ]]; then
    echo "First Time Run: Admin account created"
    echo "Username: admin"
    echo "Password: password"
    touch $SOURCE/admin_created
    mono /opt/vrs/VirtualRadar.exe -createAdmin:admin -password:password -nogui
else
    mono /opt/vrs/VirtualRadar.exe -nogui
fi
