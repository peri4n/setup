scriptencoding utf-8

if has('statusline')

    highlight statuslineGit ctermfg=2  ctermbg=18

    set laststatus=2

    set statusline=
    set statusline+=%#statuslineGit#
    set statusline+=%{FugitiveStatusline()}
    set statusline+=\ %*
    set statusline+=\ %f       " filename
    set statusline+=\ %m    " [+] if modified

    set statusline+=%=      " switching to right side
    set statusline+=\ %y
    set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
    set statusline+=\ \[%{&fileformat}\]
    set statusline+=\ %l/%L      " current line / total line
endif
