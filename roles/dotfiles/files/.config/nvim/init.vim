call plug#begin('~/.config/nvim/plugged')
" colorschemes
Plug 'chriskempson/base16-vim'

" utilities
Plug 'scrooloose/nerdcommenter' "comment multiple lines
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'oblitum/rainbow'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

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

call plug#end()

scriptencoding utf-8

filetype plugin on " enable filetype specific settings

let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256

colorscheme base16-tomorrow-night

set hidden " enable hidden buffers

set number " show line numbers

set relativenumber " center line number around current line

set showmatch " show matching braces

set expandtab " use spaces instead of tabs

set tabstop=4 " use 4 spaces

set shiftwidth=4 " use 4 spaces for indentation

set softtabstop=4 " just so that indenting behaves sane

set smartindent " auto indenting when adding new line

set showcmd " show incomplete commands

set clipboard+=unnamedplus " use onlye a single clipboard

set tags=./tags,tags;

set autoread "reread file content if file was changed outside of vim

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

set invlist " toggle invisible characters
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,space:·,eol:¬

set showbreak=↪ " show at the beginning of a wrapped line

set cursorline " highlight current line

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" rainbow paranthesis options
let g:rainbow_active = 1

" airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#right_sep = ''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'
set laststatus=2

" vim-notes options
:let g:notes_directories = ['~/docs/notes']

" ansible options
let g:ansible_options = {'ignore_blank_lines': 0}

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
endif

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore build -g ""'

" MAPPINGS

no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>n :NERDTreeToggle<cr>

nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fa :Ag<cr>

iabbrev @@ fabian.bull@bioinform.at
iabbrev waht what
iabbrev tehn then
iabbrev adn and

" Reread buffer when the file is changed in an other editor
au FocusGained,BufEnter * checktime
