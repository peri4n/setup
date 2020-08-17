" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" let g:ale_completion_enabled = 1
" ================ Plugin Config ====================

call plug#begin('~/.config/nvim/plugged')
" colorschemes
Plug 'chriskempson/base16-vim'       " Colorscheme


" utilities
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/neovim-remote'                                               " Acces NeoVim from the shell
Plug 'scrooloose/nerdcommenter'                                          " Comment multiple lines
Plug 'Shougo/neosnippet'                                                 " Template engine
Plug 'Shougo/neosnippet-snippets'                                        " Snippets collection
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'                                                " Git support
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } " File browser
Plug 'junegunn/fzf.vim'                                                  " Fuzzy finder
Plug 'jremmen/vim-ripgrep'

" Haskell
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}

" Latex
Plug 'lervag/vimtex'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }

"Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'ap/vim-css-color', { 'for': 'css' }                                 " Colorize RGB colors
Plug 'cakebaker/scss-syntax.vim'

" Others
Plug 'vimwiki/vimwiki'
Plug 'gisphm/vim-gradle'
Plug 'chase/vim-ansible-yaml'
Plug 'plasticboy/vim-markdown'

call plug#end()

" ================ General Config ====================

set number                      " Show line numbers
set relativenumber              " Center line number around current line
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden                      " Switch buffers without saving them
set showmatch                   " Show matching braces
set autoread                    " Reread file content if file was changed outside of vim
set cursorline                  " Highlight current line
set spell                       " Turn on spelling
set spelllang=en,de
syntax on                       " Turn on syntax highlighting

" ================ Turn Off Swap Files ==============

set noswapfile                  " Do not create swap files
set nobackup                    " Do not leave backup files
set wb                          " Make backup before writing a file

" ================ Indentation ======================

set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " Use 4 spaces
set shiftwidth=4                " Use 4 spaces for indentation
set softtabstop=4               " Just so that indenting behaves sane
set smartindent                 " Auto indenting when adding new line

set nowrap                      " Don't wrap lines
set linebreak                   " Wrap lines at convenient points

" ================ Invisible characters =============

set invlist                     " toggle invisible characters
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,space:·,eol:¬

set showbreak=↪                 " show at the beginning of a wrapped line

" ================ Folds ============================

set foldmethod=indent           " Fold based on indent
set foldnestmax=3               " Deepest fold is 3 levels
set nofoldenable                " vont fold by default<Paste>

" ================ Search ===========================

set incsearch                   " Find the next match as we type the search
set hlsearch                    " Highlight searches by default
set ignorecase                  " Ignore case when searching...
set smartcase                   " Unless we type a capital

" ================ Mappings =========================

let mapleader = " "
let g:mapleader = " "
let g:vimtex_compiler_progname = 'nvr'

no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>N :NERDTreeFind<cr>
nnoremap <leader>m :History<cr>

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>

nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fs :Rg
nnoremap <leader>bb :Buffers<cr>

" Split bindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-\> :vsplit<cr>
nnoremap <C-_> :split<cr>
nnoremap <C-q> :close<cr>

set splitbelow
set splitright

noremap <C-n> :bn<cr>
noremap <C-p> :bp<cr>

" ================ Abbreviations ===================

abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

iabbrev @@ fabian.bull@bioinform.at
iabbrev waht what
iabbrev tehn then
iabbrev adn and

scriptencoding utf-8

nnoremap <leader>z :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    set list!
    set number!
    set relativenumber!
endfunction

" ================ Color scheme ====================
set termguicolors
colorscheme base16-eighties

set clipboard+=unnamedplus " use onlye a single clipboard

set tags=./tags,tags;

" Reread buffer when the file is changed in an other editor
au FocusGained,BufEnter * checktime

let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

let g:haskell_indent_disable = 1

nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
