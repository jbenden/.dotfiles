#!/bin/sh

exec tmux new-session -A -s "${1:-docker}"
