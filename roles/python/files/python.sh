export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [ $commands[pyenv] ]; then

  pyenv() {
    unfunction "$0"

    eval "$(pyenv init -)"

    $0 "$@"
  }
fi
