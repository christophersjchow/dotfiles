call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

Plug 'vim-ruby/vim-ruby'

Plug 'dsawardekar/portkey'
Plug 'joukevandermaas/vim-ember-hbs'

Plug 'fatih/vim-go'

Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

Plug 'hashivim/vim-hashicorp-tools'
Plug 'klen/python-mode'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
Plug 'pbrisbin/vim-mkdir'

Plug 'Valloric/YouCompleteMe'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

source ~/.vim/platform.vim
source ~/.vim/core.vim
source ~/.vim/plugins.vim
source ~/.vim/mappings.vim

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    if !&binary && &modifiable && &filetype != 'diff'
        let l:winview = winsaveview()
        %s/\s\+$//e
        let @/=''
        call winrestview(l:winview)
    endif
endfunction
nnoremap <leader>W :call StripTrailingWhitespace()<CR>
