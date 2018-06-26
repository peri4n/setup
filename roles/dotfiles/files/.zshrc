# If profiling is needed
#zmodload zsh/zprof

autoload -Uz vcs_info
autoload -U edit-command-line

# ================ ZLE ====================
zle -N edit-command-line

# ================ Styles ====================
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*:*' formats "%F{blue}(%b)%f %i %m%u%c "
zstyle ':vcs_info:git*:*' stagedstr "%F{green}S%f"
zstyle ':vcs_info:git*:*' unstagedstr "%F{red}U%f"

precmd() {
    vcs_info
}

# ================ Options ====================
setopt PROMPT_SUBST         # enable command substitution in the prompt
setopt AUTO_CD              # enable directory switching without 'cd'
setopt APPEND_HISTORY       # append instead of replacing the history file
setopt INC_APPEND_HISTORY   # immediately append to the history file
setopt SHARE_HISTORY        # share history between different zsh sessions
setopt NULLGLOB             # if a glob does not match delete it as an argument


setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Dont write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Dont execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# ================ Key Bindings ====================
bindkey -e
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# ================ Prompt ====================
PROMPT='%F{cyan}%n%f %# ' # user name
PROMPT=$PROMPT'%F{yellow}%m%f ' # host machine
PROMPT=$PROMPT'%2c' # two directories up
PROMPT=$PROMPT' ${vcs_info_msg_0_}
\x -> '

# ================ Variables ====================
RPROMPT='%F{cyan}%h%f'

HISTFILE="$HOME/.zhistory"     # file to write the history to
HISTSIZE=10000000              # max number of commands written to history per session
SAVEHIST=10000000              # max number of lines in the history file

source $HOME/.zsh/exports
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
if [ -d ~/.zsh/shims ]; then
    for f in $HOME/.zsh/shims/*.sh; do source $f; done
fi

# ================ Plugins ====================
[ -d $HOME/.zsh/zplug/ ] && source $HOME/.zsh/zplug/init.zsh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

# ==== Util

zplug "chriskempson/base16-shell", \
    use:"scripts/base16-tomorrow-night.sh", \
    defer:0

zplug "b4b4r07/enhancd", \
    use:init.sh

if zplug check "b4b4r07/enhancd"; then
    export ENHANCD_FILTER="fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
    export ENHANCD_DOT_SHOW_FULLPATH=1
    export ENHANCD_DISABLE_DOT=1
    export ENHANCD_COMMAND=z
fi

zplug "plugins/git", \
    from:oh-my-zsh

# ==== Zsh

zplug "lukechilds/zsh-nvm"

zplug "zsh-users/zsh-syntax-highlighting", \
    defer:2

zplug "zsh-users/zsh-autosuggestions", \
    defer:2

zplug "Tarrasch/zsh-bd", \
    use:bd.zsh

# ==== Binaries

zplug "ggreer/the_silver_searcher", \
    as:command, \
    hook-build:"./build.sh", \
    use:ag

zplug "junegunn/fzf", \
    as:command, \
    hook-build:"./install --bin", \
    use:"bin/{fzf-tmux,fzf}"

zplug "firecat53/urlscan", \
    as:command, \
    hook-build:"./setup.py install", \
    use:"bin/urlscan"

zplug load

source $ZPLUG_HOME/repos/junegunn/fzf/shell/completion.zsh
source $ZPLUG_HOME/repos/junegunn/fzf/shell/key-bindings.zsh

export GPG_TTY=$(tty)

# end profiling
#zprof
