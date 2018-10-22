#!/bin/bash
usage() {
    echo -e "Usage: $0 <BARNAME> <BARNAME>"
    exit 1
}

if [ "$#" -eq 0 ]; then
    usage
fi

killall -q polybar
for i in $@; do
    polybar $i &
done
