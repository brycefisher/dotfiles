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
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'epmatsw/ag.vim'
Plugin 'Shougo/unite.vim'
Plugin 'wavded/vim-stylus'
Plugin 'Shougo/neoyank.vim'
Plugin 'neomake/neomake'

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
nnoremap <C-f> :NERDTreeFind<CR>
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

" Disable backups
set noswapfile
set nobackup
set nowritebackup

let mapleader="\<SPACE>" " Map the leader key to SPACE for easy two hand access to leader key

" Eliminate the need to press SHIFT for commands
nnoremap ; :

" Various Interface options
set number                           " Show line numbers on the left
set nowrap                           " Don't wrap lines
set ruler                            " Show the current row and column
set list listchars=tab:→\ ,trail:·   " Show tab and trailing whitespace characters
set showmode                         " Show current mode
set showcmd                          " Show (partial) command in status line
set cursorline                       " Highlight the currently active line

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Whitespace formatting
set smartindent        " Try to keep indenting the newlines based on syntax and context
set tabstop=2          " 1 TAB = 2 spaces
set shiftwidth=2       " ... same as above, don't understand the difference
set expandtab          " Insert spaces when pressing the TAB key
set nojoinspaces       " No spaces after joining lines
set fo=tcrq

" Searching options
set hlsearch         " Highlight search results
set gdefault         " Add the 'global' (/g) replacement by default
set ignorecase       " Make searching case sensitive normally
set smartcase        " ... unless the query has capital letters.
set incsearch        " Incremental search

" Use <SPACE>c to clear the highlighting of :set hlsearch.
nnoremap <leader>c :nohlsearch<CR>

" Terminal Mode
:tnoremap <Esc> <C-\><C-n>         " ESC switches back to normal mode when in a terminal buffer
:tnoremap <C-h> <C-\><C-n><C-w>h   " CTRL-h in terminal mode moves left a pane
:tnoremap <C-j> <C-\><C-n><C-w>j   " CTRL-j in terminal mode moves down a pane
:tnoremap <C-k> <C-\><C-n><C-w>k   " CTRL-k in terminal mode moves up a pane
:tnoremap <C-l> <C-\><C-n><C-w>l   " CTRL-l in terminal mode moves right a pane
":nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" Stylus filetype detection (not working in plugin :| )
autocmd BufNewFile,BufReadPost *.styl set filetype=stylus    " When creating, opening or reopening a .styl file, trigger style syntax highlighting
autocmd BufNewFile,BufReadPost *.stylus set filetype=stylus  " When creating, opening or reopening a .styl file, trigger style syntax highlighting

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :<C-u>Unite -start-insert file_rec/neovim<CR>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank history/yank<cr>
