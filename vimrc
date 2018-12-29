call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'pbrisbin/vim-mkdir'

Plug 'w0rp/ale'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'vim-ruby/vim-ruby'
Plug 'chr4/nginx.vim'
Plug 'jparise/vim-graphql'
Plug 'fatih/vim-go'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'hashivim/vim-hashicorp-tools'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

source ~/.vim/platform.vim
source ~/.vim/core.vim
source ~/.vim/plugins.vim
source ~/.vim/mappings.vim
