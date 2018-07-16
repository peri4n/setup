export PATH="$HOME/.rbenv/bin:$PATH"

if [ $commands[rbenv] ]; then

  rbenv() {
    unfunction "$0"

    eval "$(command rbenv init --no-rehash -)"

    $0 "$@"
  }
fi
