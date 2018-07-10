export PATH="$HOME/.jenv/bin:$PATH"

jenv() {
    eval "$(command jenv init - --no-rehash)"
    (jenv rehash &) 2> /dev/null
    jenv "$@"
}
