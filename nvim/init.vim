" Required by Vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Start Plugins here

Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-airline/vim-airline'
Plugin 'neomake/neomake'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" End plugins here
call vundle#end()
syntax enable
filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git$[[dir]]', 'node_modules$[[dir]]', 'newrelic_agent.log', '.githooks$[[dir]]', 'build$[[dir]]', 'lib$[[dir]]', '.coffee$[[dir]]', 'tmp$[[dir]]']

" Colorscheme
colorscheme base16-default-dark

" Airline
let g:airline_powerline_fonts = 1

" Neomake
autocmd! BufWritePost * Neomake

" Vim-GitGutter
set updatetime=250

" Fugitive
" TODO: Add branch name to airline

" Disable backups
noswapfile
set nobackup
set nowritebackup

" Set pwd to same dir as currently selected buffer
set autochdir

" Various Interface options
set nu
set nowrap
set list listchars=tab:→\ ,trail:·
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"set enc=utf-8 "Default to UTF8
set fo=tcrq
set showmode
set showcmd
set hlsearch
set cursorline

" Terminal Mode
:tnoremap <Esc> <C-\><C-n>
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
":nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l
