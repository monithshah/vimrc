" set nocompatible

call plug#begin()
  Plug 'vim-ruby/vim-ruby' " ruby syntax
  Plug 'tpope/vim-rails' " rails go to defenition
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim' " Fuzzy File search vim plugin
  Plug 'tpope/vim-commentary' " Commening Ruby files such as erb
  Plug 'vim-airline/vim-airline' " Sleek Bottom bar for vim
  Plug 'vim-airline/vim-airline-themes' " Themes for airline
  Plug 'tpope/vim-fugitive' "  Git wrapper for vim
  Plug 'pangloss/vim-javascript' "  Javascript ES6 Syntax
  Plug 'mxw/vim-jsx' " React Syntax
  Plug 'jiangmiao/auto-pairs' " Pair quotes and brackets
  Plug 'airblade/vim-gitgutter' " Changes indicator for current branch
  Plug 'Yggdroot/indentLine' " display indentation line
  Plug 'morhetz/gruvbox' " Theme for vim
  " Plug 'SirVer/ultisnips' " Snippets Manager for vim
  Plug 'honza/vim-snippets' " snippets for ruby and other languages
  Plug 'ecomba/vim-ruby-refactoring' " Handy functions like adding parameter to function, inline temp, convert to post conditional etc
  Plug 'tpope/vim-ragtag' " Closes tags for erb
  Plug 'AndrewRadev/splitjoin.vim' "  split block into multiple lines or join them into one
  Plug 'junegunn/vim-easy-align' " Text Aligning
  Plug 'nanotech/jellybeans.vim' " Best Theme Ever
  Plug 'mhartington/oceanic-next' " Sublime like theme
  " Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete Library
  Plug 'tpope/vim-endwise' " Adds 'end' to ruby def, do and if
  Plug 'jnurmine/Zenburn' " Anothe theme
  Plug 'chriskempson/base16-vim' " Lots of Base 16 themes
  Plug 'tpope/vim-surround' " Surroud with quotation, parenthesis, html tags etc
  Plug 'tpope/vim-repeat'
  Plug 'wellle/targets.vim'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'slim-template/vim-slim'
  Plug 'dense-analysis/ale'
  " Plug 'chaoren/vim-wordmotion'
  " Plug 'ajh17/VimCompletesMe'
  " Plug 'voldikss/vim-floaterm'
  " Plug 'vim-scripts/ScrollColors' " Realtime theme changer
call plug#end()

if has('gui_macvim')
  set fu
endif

set number
set relativenumber
set autoread
nnoremap <silent> <leader>nb :set relativenumber!<CR>
set backspace=indent,eol,start
" filetype on
syntax on
set maxmempattern=10000
set redrawtime=10000
filetype plugin indent on
filetype indent on
set smartindent
set laststatus=2
set ruler
set wildmenu
" set showmatch

set scrolloff=1

nnoremap - $
vnoremap - $
nnoremap c- c$
nnoremap d- d$

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab "expand tabs to spaces
set smarttab

set ignorecase
set smartcase
set incsearch

" Hardcore in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Hardcore in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Hardcore in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Spare your pinkie finger
" inoremap jk <esc>

nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" Quickly source .vimrc
nnoremap <leader>s :source $MYVIMRC<CR> " Quickly open .vimrc in new tab
nnoremap <leader>v :tabedit ~/.vimrc<CR>
nnoremap <leader>c :close<CR>
nnoremap <Leader>t :terminal<CR>

cnoremap Wq wq
cnoremap wQ wq
cnoremap WQ wq

autocmd FileType ruby setlocal commentstring=#\ %s
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

runtime macros/matchit.vim

" Auto Trim trailing white-space
autocmd BufWritePre * %s/\s\+$//e

" set termguicolors
set background=dark
let base16colorspace=256
colo jellybeans

nnoremap <Leader>i :PlugInstall<CR>

let $FZF_DEFAULT_COMMAND = 'rg --files'
nnoremap <C-p> :FZF<CR>

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

set guifont=Meslo\ LG\ M\ for\ Powerline:h12

set tags=./tmp/tags;

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Copy or paste to / from sysytem clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

" Restore vim mappings overidden by vim-wordmotion plugin
nmap dw de
nmap cw ce

" Add new line above or below cursor
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j

inoremap <C-o> <Esc>A<CR>
inoremap <C-a> <Esc>A

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<C-b>"
" let g:UltiSnipsJumpBackwardTrigger="<C-z>"

inoremap <C-w> <ESC>wa

nnoremap <C-s> :Rg<Space>

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'ruby': ['rubocop'],
\}

nnoremap <Leader>f :ALEFix<Return>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeoutlen=10

nnoremap <S-Right> gt
nnoremap <S-left> gT
