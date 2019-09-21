#!/bin/bash

## Ensure APT is present
if ! type apt-get >/dev/null 2>/dev/null; then
	echo "Apt missing"
	exit 0
fi

apt=$(apt-get upgrade -qqsf | grep -E '^Inst' | cut -d ' ' -f 2 | wc -l)

if [ $apt -gt 0 ]; then
    echo "%{F#900}%{F-} %{F#900}$apt%{F-} updates"
else
    echo "%{F#666}%{F-}"
fi
