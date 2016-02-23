" ------------------------------------------------------------------------------
" File: core.vim
" Description: Core configuration that shouldn't require any plugins.
" Author: Christopher Chow <chris@chowie.net>
" ------------------------------------------------------------------------------

" -----------------------------
" Color
" -----------------------------
let base16colorspace=256
set background=dark
colorscheme base16-tomorrow

" Force 256 color mode if available
if $TERM =~ '-256color'
  set t_Co=256
endif

" -----------------------------
" General Settings
" -----------------------------
syntax on

command! W :w                                " Seriously, it's not like :W is bound
set nocompatible                             " Turn off vi compatibility.

set encoding=utf8                            " Always use unicode.
set spelllang=en_au                          " Set spell check language.
set shortmess=aIoO                           " Show short messages, no intro.

set hidden                                   " Allow hidden buffers.
set history=100                              " Size of command history.
set confirm                                  " Enable error files & error jumping.
set autoread                                 " Automatically reload changes if detected

set notimeout
set ttimeout
set timeoutlen=50

set tags+=tags                               " Enable tags.

set selection=inclusive                      " Select to the end of line.

filetype on                                  " Detect file type.
filetype indent on                           " Enable file indenting.
filetype plugin indent on                    " Load syntax files for better indenting.

if has('mouse')
  set mouse=a                                " Enable mouse everywhere.
  set mousemodel=popup_setpos                " Show a pop-up for right-click.
  set mousehide                              " Hide mouse while typing.
endif

" -----------------------------
" Backups and undo
" -----------------------------
set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile
set undolevels=1000                          " Large undo levels.

" Persistent Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo
endif

" -----------------------------
" Search and Replace
" -----------------------------
set incsearch                                " Show partial matches as search is entered.
set hlsearch                                 " Highlight search patterns.
set ignorecase                               " Enable case insensitive search.
set smartcase                                " Disable case insensitivity if mixed case.
set wrapscan                                 " Wrap to top of buffer when searching.
set gdefault                                 " Make search and replace global by default.

" -----------------------------
" Text Format
" -----------------------------
set tabstop=2
set backspace=indent,eol,start               " Delete everything with backspace
set shiftwidth=2                             " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab

" -----------------------------
" Visual
" -----------------------------
set showmatch                                " Show matching brackets.
set matchpairs+=<:>                          " Pairs to match.
set matchtime=2                              " How many tenths of a second to blink
set list                                     " Show invisible characters

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

set listchars=""                             " Reset the listchars
set listchars+=trail:•                       " Show trailing spaces as dots

" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" -----------------------------
" UI
" -----------------------------
set ruler                                    " Show the cursor position.
set nowrap                                   " Line wrapping off
set laststatus=2                             " Always show the statusline
set fillchars+=stl:\ ,stlnc:\ " Space.       " Disable status line fill chars.
set showcmd                                  " Show last command.
set noshowmode                               " Don't show the mode since airline shows it
set title                                    " Set the title of the window in the terminal to the file

if exists('+colorcolumn')
  highlight colorcolumn ctermbg=236 guibg=#262D51
endif

" -----------------------------
" Sounds
" -----------------------------
set noerrorbells
set novisualbell
set t_vb=

" -----------------------------
" Languages
" -----------------------------
au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
au FileType go setlocal noexpandtab nolist

