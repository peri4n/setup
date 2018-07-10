export PATH="$HOME/.rbenv/bin:$PATH"

rbenv() {
  eval "$(command rbenv init --no-rehash -)"
  (rbenv rehash &) 2> /dev/null
  rbenv "$@"
}
