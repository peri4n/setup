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

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR=nvim
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Enable syntax highlighting
if [[ $(uname) == Darwin ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# SHIMS

eval "$(fasd --init posix-alias zsh-hook)"

# pyenv
eval "$(pyenv init -)"

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -s "/usr/share/autojump/autojump.sh" ] && . "/usr/share/autojump/autojump.sh"

# Add RBENV to PATH for scripting
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Add stack binaries
export PATH="$HOME/.local/bin:$PATH"
#
# base 16 color theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_default-dark

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$(tty)

##########
# ALIASES
##########

# utility
alias nv='nvim'
alias gw='./gradlew'
alias gwi='./gradlew -i'
alias mkdir='mkdir -pv'
alias o='open'
alias x='exit'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias l='ls -lGh'
alias ll='ls -alGh'

alias ff="find . -type f -name"

# post aliases
alias -g M='| more'
alias -g C='| pbcopy'
alias -g G='| grep'

# git
alias git=hub
alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gcan='git commit --amend --no-edit'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git checkout master'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gda='git diff --cached'
alias gf='git fetch'
alias gl='git pull'
alias glg='git log --stat --color'
alias glog='git log --oneline --decorate --color --graph'
alias glol='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gp='git push'
alias gst='git status --short --branch'
alias grc='git rev-parse HEAD | pbcopy'

# vagrant
alias vup='vagrant up'
alias vdn='vagrant halt'

# taskwarrior
alias tw='task'
alias twa='task add'
alias twd='task done'
alias twl='task log'

# password store
alias pw='pass'

##########
# FUNCTIONS
##########

mcd () {
    mkdir "$1" && cd "$1"
}

