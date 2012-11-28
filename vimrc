" ------------------------------------------------------------------------------
"          FILE: .vimrc
"   DESCRIPTION: Vim configuration file. Based heavily on Sorin Ionescu's.
"        AUTHOR: Christopher Chow (chris at chowie dot net)
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
command! W :w                                " Seriously, it's not like :W is bound
                                             " to anything anyway.
set nocompatible                             " Turn off vi compatibility.
set undolevels=1000                          " Large undo levels.
set undofile                                 " Save undo tree.
set undodir=/tmp                             " Undo tree directory.
set history=50                               " Size of command history.
set encoding=utf8                            " Always use unicode.
set clipboard+=unnamed                       " Share the clipboard.
set backspace=indent,eol,start               " Fix backspace.

set nobackup                                 " Disable backups.
set nowritebackup
set noswapfile

set notimeout                                " Fix lag in iTerm.
set ttimeout
set timeoutlen=50
set nomodeline

set spelllang=en_au                          " Set spell check language.

" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Self manage vundle.
Bundle 'gmarik/vundle'

" Language / syntax support.
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bbommarito/vim-slim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'othree/html5.vim'
Bundle 'claco/jasmine.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'

" Git
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" Fuzzy file finder
Bundle 'kien/ctrlp.vim'

" Call ack from vim
Bundle 'mileszs/ack.vim'

" Surround text keybindings
Bundle 'tpope/vim-surround'

" Launch rspec tests from vim
Bundle 'skalnik/vim-vroom'

" Format tabular text (ie Cucumber)
Bundle 'godlygeek/tabular'

" Manage undos as a tree
Bundle 'sjl/gundo.vim'

" Commenting plugin
Bundle 'tomtom/tcomment_vim'

" Better status bar
Bundle 'Lokaltog/vim-powerline'

" Auto detect indentation settings
Bundle 'Raimondi/YAIFA'

" Kill buffers without closing windows
Bundle 'vim-scripts/bufkill.vim'

" Maintain widths of windows
Bundle 'roman/golden-ratio'

" Indent pasted lines properly. No more :set paste.
Bundle 'sickill/vim-pasta'

" Automatically closes quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'

" Indentation-based text objects.
Bundle 'michaeljsmith/vim-indent-object'

" Displays indent levels.
Bundle 'nathanaelkane/vim-indent-guides'

" Configures % to match more than just single characters.
Bundle 'vim-scripts/matchit.zip'

" Tab completion
Bundle 'ervandew/supertab'

" Themes
Bundle 'dandorman/vim-colors'
Bundle 'kien/rainbow_parentheses.vim'

" ------------------------------------------------------------------------------
" Binds
" ------------------------------------------------------------------------------
let mapleader = ","               " Use comma as leader.

" set pastetoggle=<F5>              " Paste with sane indentation.

" Do what Gary Bernhardt does for removing search results.
function! MapCR()
  nnoremap <CR> :nohlsearch<CR>
endfunction
call MapCR()

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Move around splits with by holding Ctrl.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Strip all trailing whistpace.
nnoremap <leader>W :call StripTrailingWhitespace()<CR>

" Ack
nnoremap <leader>a :Ack<space>

" Tabular
nmap <Leader>c<Bar> :Tabularize /<Bar><CR>
vmap <Leader>c<Bar> :Tabularize /<Bar><CR>
nmap <Leader>c, :Tabularize /,<CR>
vmap <Leader>c, :Tabularize /,<CR>

" Rainbow Parenthesis
nmap <Leader>rp :RainbowParenthesesToggle<CR>

" ------------------------------------------------------------------------------
" CtrlP
" ------------------------------------------------------------------------------
map <Leader>t :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>p :CtrlPMRU<CR>

let g:ctrlp_user_command = {
\ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
\ 'fallback': 'find . -type f | egrep "^\.[\/.]\.(git/|hg|svn/|gitmodules|DS_Store)"'
\ }

" ------------------------------------------------------------------------------
" Search and Replace
" ------------------------------------------------------------------------------
set incsearch                     " Show partial matches as search is entered.
set hlsearch                      " Highlight search patterns.
set ignorecase                    " Enable case insensitive search.
set smartcase                     " Disable case insensitivity if mixed case.
set wrapscan                      " Wrap to top of buffer when searching.
set gdefault                      " Make search and replace global by default.


" ------------------------------------------------------------------------------
" White Space
" ------------------------------------------------------------------------------
set tabstop=4                     " Set tab to equal 4 spaces.
set softtabstop=4                 " Set soft tabs equal to 4 spaces.
set shiftwidth=4                  " Set auto indent spacing.
set shiftround                    " Shift to the next round tab stop.
set expandtab                     " Expand tabs into spaces.
set smarttab                      " Insert spaces in front of lines.
set listchars=tab:··,trail:·      " Show leading whitespace
set list


" ------------------------------------------------------------------------------
" Presentation
" ------------------------------------------------------------------------------
set shortmess=aIoO                " Show short messages, no intro.
set ttyfast                       " Fast scrolling when on a decent connection.
set wrap                          " Wrap text.
set showcmd                       " Show last command.
set ruler                         " Show the cursor position.
set relativenumber                " Show how far a line is from current line.
set hidden                        " Allow hidden buffers.
set showmatch                     " Show matching parenthesis.
set matchpairs+=<:>               " Pairs to match.
set cursorline                    " Highlight the current line.
set number                        " Show line numbers.
set cmdheight=2                   " Make command line height to 2 lines.
set cf                            " Enable error jumping.
syntax on                         " Enable syntax highlighting.
filetype on                       " Detect file type.
filetype indent on                " Enable file indenting.
filetype plugin indent on         " Load syntax files for better indenting.


" ------------------------------------------------------------------------------
" User Interface
" ------------------------------------------------------------------------------
if has('gui_running')
    set guioptions-=m             " Disable menu bar.
    set guioptions-=T             " Disable the tool bar bar.
    set guioptions-=l             " Disable left scrollbar.
    set guioptions-=L             " Disable left scrollbar when split.
    set guioptions-=r             " Diable right scrollbar.
    set guioptions-=a             " Do not auto copy selection to clipboard.

    " If MacVim do some specific things.
    if has('gui_macvim')
        set guifont=Monaco\ for\ Powerline:h16
        colorscheme solarized             " Color scheme.
        set lines=52                      " Window size.
        set columns=165
        set vb                            " Disable the audible bell.

        " Remove some shortcuts defined in MacVim
        macmenu &File.New\ Tab key=<D-S-t>
        macmenu &File.Print key=<nop>
        macmenu &Tools.Make key=<nop>
    endif
else
    colorscheme grb256
    set selection=exclusive           " Do not select the end of line.
endif

if has('mouse')
    set mouse=a                   " Enable mouse everywhere.
    set mousemodel=popup_setpos   " Show a pop-up for right-click.
    set mousehide                 " Hide mouse while typing.
endif

" ------------------------------------------------------------------------------
" Status Line
" ------------------------------------------------------------------------------

" Always show status.
set laststatus=2

" Disable status line fill chars.
set fillchars+=stl:\ ,stlnc:\ " Space.

" Highlight the current line in the current window.
aug cursorline
    au!
    au BufEnter * set cursorline
    au BufLeave * set nocursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
aug end

" ------------------------------------------------------------------------------
" Powerline
" ------------------------------------------------------------------------------
" Use short path.
let g:Powerline_stl_path_style = 'filename'


" ------------------------------------------------------------------------------
" Gundo
" ------------------------------------------------------------------------------

nnoremap <Leader>U :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" ------------------------------------------------------------------------------
" Rainbow Parenthesis
" ------------------------------------------------------------------------------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ------------------------------------------------------------------------------
" Indent Guides
" ------------------------------------------------------------------------------

" Auto calculate guide colors.
let g:indent_guides_auto_colors = 1

" Use skinny guides.
let g:indent_guides_guide_size = 1

" Indent from level 2.
let g:indent_guides_start_level = 3

" ------------------------------------------------------------------------------
" Functions
" ------------------------------------------------------------------------------

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    if !&binary && &modifiable && &filetype != 'diff'
        let l:winview = winsaveview()
        %s/\s\+$//e
        let @/=''
        call winrestview(l:winview)
    endif
endfunction
