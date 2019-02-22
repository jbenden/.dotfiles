#!/bin/sh

set -euf

find ~/.config/autostart -name '*.desktop' -exec xdg-open {} ';'

exit 0
