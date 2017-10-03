autoload -U promptinit && promptinit # initialize the prompt system promptinit
autoload -U compinit && compinit
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*:*' formats "%F{blue}(%b)%f %i %m%u%c "
zstyle ':vcs_info:git*:*' stagedstr "%F{green}S%f"
zstyle ':vcs_info:git*:*' unstagedstr "%F{red}U%f"

precmd() {
    vcs_info
}

setopt PROMPT_SUBST # enable command substitution in the prompt
setopt AUTO_CD # enable directory switching without 'cd'
setopt APPEND_HISTORY # append instead of replacing the history file
setopt INC_APPEND_HISTORY # immediately append to the history file
setopt SHARE_HISTORY # share history between different zsh sessions

bindkey -e

PROMPT='%F{cyan}%n%f %# ' # user name
PROMPT=$PROMPT'%F{yellow}%m%f ' # host machine
PROMPT=$PROMPT'%2c' # two directories up
PROMPT=$PROMPT' ${vcs_info_msg_0_}
\x -> '

RPROMPT='%F{cyan}%h%f'

HISTFILE=$HOME/.zsh_history # file to write the history to

HISTSIZE=1000 # max number of commands written to history per session

SAVEHIST=100000 # max number of lines in the history file

source $HOME/.zsh/exports
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
for f in ~/.zsh/shims/*.sh; do source $f; done

# Enable syntax highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# SHIMS

eval "$(fasd --init posix-alias zsh-hook)"
#
# base 16 color theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_default-dark

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$(tty)
