export PATH="$HOME/.jenv/bin:$PATH"

if [ $commands[jenv] ]; then

  jenv() {
    unfunction "$0"

    eval "$(command jenv init - --no-rehash)"

    $0 "$@"
  }
fi
