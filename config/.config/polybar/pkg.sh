#!/bin/bash
apt=$(apt-get upgrade -qqs | grep -E '^Inst' | cut -d ' ' -f 2 | wc -l)

if [ $apt -gt 0 ]; then
    echo " $apt updates..."
else
    echo ""
fi
