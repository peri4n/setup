# Terminfo

This role adds support for italics to tmux. It is a direct translation of a tutorial posted on 
[reddit][reddit tutorial]. 

## Do you need it?

You can check if your terminal already supports italics with:

```
echo -e "\e[3mfoo\e[23m"
```

## How it works

It adds new entries (`tmux`, `tmux-256color`) to the terminal capability database.
These two files tell terminfo to derive the capabilities from `screen` and `screen-256color` respectively.but add italics.

[reddit tutorial]: https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/
