#!/bin/sh

valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes /usr/lib64/firefox/firefox-bin

exit 0
