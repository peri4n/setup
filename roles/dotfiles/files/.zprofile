# Add Stack binaries
export PATH="$HOME/.local/bin/:$PATH"

archey3

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &> /dev/null
fi
