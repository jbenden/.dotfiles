#!/usr/bin/env bash

set -e

LINKS="http://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-dvd/debian-testing-amd64-DVD-1.iso http://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-dvd/debian-testing-amd64-DVD-2.iso http://cdimage.debian.org/cdimage/weekly-builds/amd64/iso-dvd/debian-testing-amd64-DVD-3.iso"

for LINK in $LINKS; do
    curl -RLO $LINK
    if [ $? -ne 0 ]; then
        exit 192
    fi
done

exit 0
