set -x EDITOR /usr/bin/nvim
set -x TERMINAL kitty
set -x BROWSER firefox
set -x READER zathura
set -x FILE ranger
set -x SUDO_ASKPASS "$HOME/bin/dmenupass"
set -x SCRIPT_DIR "$HOME/bin"
set -x PATH "$PATH:$HOME/bin"
set -x PASSIVE_FTP 1
set -x INPUTRC "$HOME/.inputrc"
set -x PAGER /usr/bin/bat
# set -x TMPDIR /home/jbenden/tmp
set -x SAL_USE_VCLPLUGIN kde5
set -x VDPAU_DRIVER va_gl

# fix broken tray menu and in-app shortcuts on Ubuntu/Unity
set -x UBUNTU_MENUPROXY ''
