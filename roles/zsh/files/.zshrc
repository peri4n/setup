# If profiling is needed
#zmodload zsh/zprof

autoload -Uz compinit
compinit

autoload -U edit-command-line

# ================ ZLE ====================
zle -N edit-command-line

# ================ Options ====================
setopt PROMPT_SUBST              # Enable command substitution in the prompt
setopt AUTO_CD                   # Enable directory switching without 'cd'
setopt NULL_GLOB                 # If a glob does not match delete it as an argument
setopt AUTO_PARAM_SLASH          # Tab completing directory appends a slash
setopt NO_FLOW_CONTROL           # Disable start (C-s) and stop (C-q) characters

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt APPEND_HISTORY            # Append instead of replacing the history file
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

setopt VI                        # Enable vi mode

# ================ Key Bindings ====================
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


# ================ Variables ====================

HISTFILE="$HOME/.zhistory"     # file to write the history to
HISTSIZE=10000000              # max number of commands written to history per session
SAVEHIST=10000000              # max number of lines in the history file

source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# To define styles for nested brackets up to level 4
FAST_HIGHLIGHT_STYLES[bracket-level-1]='fg=magenta,bold'
FAST_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
FAST_HIGHLIGHT_STYLES[bracket-level-3]='fg=blue,bold'

# Declare the variable
typeset -A FAST_HIGHLIGHT_STYLES
# To differentiate aliases from other command types
FAST_HIGHLIGHT_STYLES[alias]='fg=cyan'
FAST_HIGHLIGHT_STYLES[unknown-token]='fg=white'
FAST_HIGHLIGHT_STYLES[command]='fg=green'
FAST_HIGHLIGHT_STYLES[globbing]='fg=blue'
FAST_HIGHLIGHT_STYLES[subcommand]='fg=yellow'

source $HOME/.zsh/exports
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
if [ -d ~/.zsh/shims ]; then
    for f in $HOME/.zsh/shims/*.sh; do source $f; done
fi

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/autojump/autojump.zsh

bindkey '^ ' autosuggest-accept  # Ctrl Space
bindkey '^[^M' autosuggest-execute # Ctrl-Enter
export GPG_TTY=$(tty)

# ================ Prompt ====================
PROMPT="%F{magenta}%(!.#.$)%f "

# end profiling
#zprof
