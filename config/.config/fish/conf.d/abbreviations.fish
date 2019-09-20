function take -d "Create and change into directory"
	mkdir "$argv"
	cd "$argv"
end

abbr g 'git status'
abbr gx "git log --pretty=oneline --graph --all --abbrev-commit"
abbr more bat
abbr less bat
abbr weather "~/go/bin/wego -d 4"
abbr gotop "~/go/bin/gotop"
abbr tm 'tmux a || tmux'
abbr mpv 'mpv --vo=vdpau --hwdec=vdpau'
abbr hex 'od -t -x1'
abbr acbuild 'autoreconf -vif && ./configure --with-experimental && make && make check'
abbr docker-compose 'env TMP=/home/jbenden/tmp docker-compose'
abbr alu 'apt list --upgradable'
abbr f 'ranger'
abbr e "/usr/bin/nvim"
abbr v "/usr/bin/nvim"
abbr x "sxiv -ft *"
abbr sysinfo "inxi -v5 -xxx"
abbr ci "watch -e -n 60 -c gh-status"
