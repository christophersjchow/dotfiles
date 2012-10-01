" ------------------------------------------------------------------------------
"          FILE: .vimrc
"   DESCRIPTION: Vim configuration file. Based heavily on Sorin Ionescu's.
"        AUTHOR: Christopher Chow (chris at chowie dot net)
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
command! W :w                     " Seriously, it's not like :W is bound
                                  " to anything anyway.
set nocompatible                  " Turn off vi compatibility.
set undolevels=1000               " Large undo levels.
set history=50                    " Size of command history.
set encoding=utf8                 " Always use unicode.
set clipboard+=unnamed            " Share the clipboard.
set backspace=indent,eol,start    " Fix backspace.
set nobackup                      " No backups
set nowritebackup
set notimeout                     " Fix lag in iTerm.
set ttimeout
set timeoutlen=50
set nomodeline

if version > 7.2
    set noundofile                " Don't save undo tree.
endif

set spelllang=en_au               " Set spell check language.

" ------------------------------------------------------------------------------
" Binds
" ------------------------------------------------------------------------------
let mapleader = ","               " Use comma as leader.

set pastetoggle=<F5>              " Paste with sane indentation.

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

" CtrlP
map <Leader>t :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>p :CtrlPMRU<CR>

" Strip all trailing whistpace.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack
nnoremap <leader>a :Ack 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename current file interactively. Stolen from @garybernhardt on Github.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" ------------------------------------------------------------------------------
" Run pathogen.
" ------------------------------------------------------------------------------
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


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

" Set color for line highlight.
hi CursorLine cterm=NONE ctermbg=black

" Custom colours for completion menu.
hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

if has("gui_running")
    set guioptions-=m             " Disable menu bar.
    set guioptions-=T             " Disable the tool bar bar.
    set guioptions-=l             " Disable left scrollbar.
    set guioptions-=L             " Disable left scrollbar when split.
    set guioptions-=r             " Diable right scrollbar.
    set guioptions-=a             " Do not auto copy selection to clipboard.

    " If MacVim do some specific things.
    if has('gui_macvim')
        colorscheme solarized             " Color scheme.
        set guifont=Monaco:h16            " Use Monaco font on OSX.
        set lines=52                      " Window size.
        set columns=165
        set vb                            " Disable the audible bell.

        " Remove some shortcuts defined in MacVim
        macmenu &File.New\ Tab key=<D-S-t>
        macmenu &File.Print key=<nop>
        macmenu &Tools.Make key=<nop>
    endif
else
    colorscheme Tomorrow-Night-Bright
    set guifont=Monaco:h13            " Use a good font.
    set selection=exclusive           " Do not select the end of line.
endif

if has('mouse')
    set mouse=a                   " Enable mouse everywhere.
    set mousemodel=popup_setpos   " Show a pop-up for right-click.
    set mousehide                 " Hide mouse while typing.
endif


" ------------------------------------------------------------------------------
" Auto Commands
" ------------------------------------------------------------------------------
if has("autocmd")
    " Jump to the last known position when reopening a file.
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal! g'\"" |
        \ endif

    " Enable soft-wrapping for text files.
    au FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

    " Reduce tab length for certain files types.
    au FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
    au FileType sass setlocal expandtab shiftwidth=2 tabstop=2
    au FileType haml setlocal expandtab shiftwidth=2 tabstop=2
    au FileType cucumber setlocal expandtab shiftwidth=2 tabstop=2
    au FileType coffee setlocal expandtab shiftwidth=2 tabstop=2
    au FileType gitconfig setlocal expandtab shiftwidth=2 tabstop=2
    au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

    au BufNewFile,BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
endif

hi def link rubyRspec Function
