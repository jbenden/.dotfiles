#!/bin/sh

set -euf

# https://askubuntu.com/questions/5172/running-a-desktop-file-in-the-terminal
find ~/.config/autostart -name '*.desktop' -exec kioclient exec {} ';'

exit 0
