call plug#begin('~/.vim/plugged')

" Language / syntax support.
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
Plug 'dsawardekar/portkey' | Plug 'dsawardekar/ember.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'elzr/vim-json'
Plug 'noprompt/vim-yardoc'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'ap/vim-css-color'
Plug 'ynkdir/vim-vimlparser' | Plug 'syngan/vim-vimlint'
Plug 'mutewinter/tomdoc.vim'
Plug 'cespare/vim-toml'

Plug 'janko-m/vim-test'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'henrik/rename.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'Valloric/YouCompleteMe'
Plug 'dyng/auto_mkdir'

" Themes
Plug 'chriskempson/base16-vim'

call plug#end()

source ~/.vim/platform.vim
source ~/.vim/core.vim
source ~/.vim/mappings.vim

for g:f in split(glob('~/.vim/plugins/*.vim'), '\n')
  exe 'source' g:f
endfor

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
