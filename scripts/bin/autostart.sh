#!/bin/sh

set -euf

# https://askubuntu.com/questions/5172/running-a-desktop-file-in-the-terminal
find ~/.config/autostart -follow -name '*.desktop' -print | sort | xargs -n1 -I{} kioclient5 exec {}

exit 0
