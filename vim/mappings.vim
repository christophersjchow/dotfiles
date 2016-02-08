" ------------------------------------------------------------------------------
" File: mappings.vim
" Description: Custom keybindings
" Author: Christopher Chow <chris@chowie.net>
" ------------------------------------------------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let g:maplocalleader = '\\'
let g:mapleader = ','

" Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
" make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@

" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k

" Toggle paste mode with F5
nnoremap <F5> :set paste!<CR>

" Remap ESC
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" Use v to toggle visual mode.
vnoremap v <esc>

if has('nvim')
  tnoremap <Leader>e <C-\><C-n>
end

if !exists(':Ag')
  nnoremap <leader>f :Ag<space>
  nnoremap <silent> <leader>as :AgFromSearch<CR>
end

if !exists(':TestFile')
  nnoremap <silent> <leader>R :w<CR> :TestNearest<CR>
  nnoremap <silent> <leader>r :w<CR> :TestFile<CR>
  nnoremap <silent> <leader>a :w<CR> :TestSuite<CR>
  nnoremap <silent> <leader>l :w<CR> :TestLast<CR>
  nnoremap <silent> <leader>g :w<CR> :TestVisit<CR>
end

if !exists(':Rename!')
  nnoremap <Leader><Leader>r :Rename!<space>
end

nnoremap <leader>t :Files<CR>
