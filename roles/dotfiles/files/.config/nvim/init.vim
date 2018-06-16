" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype plugin on              " Enable filetype specific settings
filetype indent on

" ================ Plugin Config ====================

call plug#begin('~/.config/nvim/plugged')
" colorschemes
Plug 'chriskempson/base16-vim'

" utilities
Plug 'scrooloose/nerdcommenter' "comment multiple lines
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'oblitum/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/goyo.vim'

" language specific
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'gisphm/vim-gradle'
Plug 'chase/vim-ansible-yaml'
Plug 'lervag/vimtex'

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

let mapleader = ','
let g:mapleader = ','

no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>n :NERDTreeToggle<cr>

nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fa :Ag<cr>

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

" ================ Color scheme ====================

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set clipboard+=unnamedplus " use onlye a single clipboard

set tags=./tags,tags;

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
endif

" Reread buffer when the file is changed in an other editor
au FocusGained,BufEnter * checktime
