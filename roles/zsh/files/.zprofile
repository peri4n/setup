# Add Stack binaries
export PATH="$HOME/.local/bin/:$HOME/dev/tools/scripts/:$PATH"

export VISUAL="nvim"
export EDITOR="nvim"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &> /dev/null
fi
