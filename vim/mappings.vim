" ------------------------------------------------------------------------------
" File: mappings.vim
" Description: Custom keybindings
" Author: Christopher Chow <chris@chowie.net>
" ------------------------------------------------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let maplocalleader = '\\'
let mapleader = ','

" Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
" make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@

" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k

" Toggle paste mode with F5
nnoremap <silent> <F5> :set paste!<CR>

if !exists(':Rename!')
  nnoremap <Leader><Leader>r :Rename!<space>
end

" Remap ESC
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" Use v to toggle visual mode.
vnoremap v <esc>
