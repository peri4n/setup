export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

pyenv() {
  eval "$(pyenv init -)"
  pyenv "$@"
}
