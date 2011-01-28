" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set ignorecase          " make searches case-sensitive only if they contain upper-case characters
set smartcase

set hlsearch            " highlight searches
set incsearch	        " do incremental searching

set ruler		        " show the cursor position all the time
set showcmd		        " display incomplete commands
set guifont=Monaco:h13  " set font
set cmdheight=2         " set command height to 2 lines
set number              " show line numbers
set mouse=a             " enable mouse
set history=1000
colors grb4             " colours
syntax on

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" make tab completion for files/buffers act like bash
" use emacs-style tab completion when selecting files, etc
" set wildmenu
" set wildmode=longest,list

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" do not keep a backup file, use versions instead
set nobackup
set nowritebackup

" indentation
filetype plugin indent on
autocmd FileType ruby setlocal expandtab shiftwidth=2  tabstop=2
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" set line highlight
set cursorline
hi CursorLine cterm=NONE ctermbg=black

" custom colours for completion menu
hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>
