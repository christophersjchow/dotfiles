call plug#begin('~/.vim/plugged')

" Platform {{{
  if has('win32') || has('win64')
    " Windows
    source $VIMRUNTIME/mswin.vim
    set guifont=Consolas:h10
    set guioptions-=T " Toolbar
    set guioptions-=m " Menubar

    " Set height and width on Windows
    set lines=60
    set columns=120

    " Disable quickfixsigns on Windows due to incredible slowdown.
    let g:loaded_quickfixsigns=1

    " Windows has a nasty habit of launching gVim in the wrong working directory
    cd ~
  elseif has('gui_macvim')
    " MacVim

    " Custom Source Code font for Powerline
    " From: https://github.com/Lokaltog/powerline-fonts
    set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono:h15
    set lines=52                      " Window size.
    set columns=165
    set vb                            " Disable the audible bell.

    if has('gui_running')
      set guioptions-=m " Disable menu bar.
      set guioptions-=T " Disable the toolbar.
      set guioptions-=l " Disable left scrollbar.
      set guioptions-=L " Disable left scrollbar when split.
      set guioptions-=r " Diable right scrollbar.
      set guioptions-=a " Do not auto copy selection to clipboard.
    endif
  endif
" }}}

" General Settings {{{
  syntax on                                    " Enable syntax highlighting

  command! W :w                                " Seriously, it's not like :W is bound
  set nocompatible                             " Turn off vi compatibility.

  set modeline                                 " Enable reading modelines
  set modelines=1                              " Only read single modelines
  set encoding=utf8                            " Always use unicode.
  set spelllang=en_au                          " Set spell check language.
  set shortmess=aIoOc                          " Show short messages, no intro.

  set hidden                                   " Allow hidden buffers.
  set history=100                              " Size of command history.
  set confirm                                  " Enable error files & error jumping.
  set autoread                                 " Automatically reload changes if detected
  set updatetime=200                           " Set wait time for cursor related actions

  set tags+=tags                               " Enable tags.
  set wildignore+=*/.git/*,*/tmp/*,*.swp       " Ignore files that aren't needed.

  set selection=inclusive                      " Select to the end of line.

  filetype on                                  " Detect file type.
  filetype indent on                           " Enable file indenting.
  filetype plugin indent on                    " Load syntax files for better indenting.

  if has('mouse')
    set mouse=a                                " Enable mouse everywhere.
    set mousemodel=popup_setpos                " Show a pop-up for right-click.
    set mousehide                              " Hide mouse while typing.
  endif

  set secure                                   " Don't allow shell or write commands

  " Backups and undo
  set nobackup                                 " Disable backups.
  set nowritebackup
  set noswapfile
  set undolevels=1000                          " Large undo levels.

  " Persistent Undo
  if has('persistent_undo')
    set undofile

    if has('nvim-0.5')
      " New format in https://github.com/neovim/neovim/pull/13973 (f42e932,
      " 2021-04-13).
      set undodir=~/.vim/undo2
    else
      set undodir=~/.vim/undo
    endif
  endif

  " Search and Replace
  set incsearch                                " Show partial matches as search is entered.
  set hlsearch                                 " Highlight search patterns.
  set ignorecase                               " Enable case insensitive search.
  set smartcase                                " Disable case insensitivity if mixed case.
  set wrapscan                                 " Wrap to top of buffer when searching.
  set gdefault                                 " Make search and replace global by default.

  " Text Format
  set tabstop=2
  set backspace=indent,eol,start               " Delete everything with backspace
  set shiftwidth=2                             " Tabs under smart indent
  set shiftround                               " Shift correctly even if off by 1
  set autoindent                               " Insert tabs on newlines
  set smarttab                                 " Use previous settings when tabbing
  set expandtab                                " Spaces instead of tabs

  " Visual
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

  " Disable Sounds
  set noerrorbells
  set novisualbell
" }}}

" Appearance {{{
  set ruler                                    " Show the cursor position.
  set wrap                                     " Line wrapping on
  set laststatus=2                             " Always show the statusline
  set fillchars+=stl:\ ,stlnc:\ " Space.       " Disable status line fill chars
  set showcmd                                  " Show last command
  set cmdheight=2                              " Command line height to 2
  set noshowmode                               " Don't show the mode since airline shows it
  set title                                    " Set the title of the window in the terminal to the file
  set signcolumn=yes                           " Always show sign column

  set foldenable                               " Don't fold by default
  set foldmethod=marker                        " Fold based on syntax
  set foldlevelstart=99                        " Start with all folds open
  set foldnestmax=10                           " Deepest fold is 10 levels

  if exists('+colorcolumn')
    set colorcolumn=120
    highlight colorcolumn ctermbg=236 guibg=#262D51
  endif

  Plug 'fnune/base16-vim'                      " Theme
  Plug 'ryanoasis/vim-devicons'                " Icons for statusbar and other plugins

  " vim-airline {{{
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'

      let g:airline_theme = 'base16'
      let g:airline_powerline_fonts = 1
      let g:airline_detect_modified = 1
      let g:airline#extensions#whitespace#enabled = 1
      let g:airline#extensions#hunks#enabled = 0
      let g:airline#extensions#coc#enabled = 1
    " }}}
" }}}

" General Bindings {{{
  " Set leader to ,
  " Note: This line MUST come before any <leader> mappings
  let g:maplocalleader = '\\'
  let g:mapleader = ','

  " Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
  " make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
  nnoremap Q @@

  " Removes doc lookup mapping because it's easy to fat finger and never useful.
  " nnoremap K k
  " vnoremap K k

  " Remap ESC
  inoremap jj <ESC>
  inoremap jk <ESC>
  inoremap kj <ESC>

  " Use v to toggle visual mode.
  vnoremap v <esc>

  if has('nvim')
    tnoremap <Leader>e <C-\><C-n>
  end
" }}}

" General Functionality {{{
  Plug 'tpope/vim-sleuth'                      " Detect indent style
  Plug 'tpope/vim-commentary'                  " Comment code using vim motions
  Plug 'tpope/vim-surround'                    " Deal with surrounding text elements (quotes, parenthenses)
  Plug 'tpope/vim-repeat'                      " Support using dot operator for other plugins
  Plug 'pbrisbin/vim-mkdir'                    " Automatically create directories when creating new buffers

  " vim-fugitive {{{
    Plug 'tpope/vim-fugitive'                  " Git commands in vim
  " }}}

  " Fuzzy Finder and Search (FZF) {{{
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    " Override the default command with ripgrep to include all files
    let $FZF_DEFAULT_COMMAND='rg --files --hidden --ignore --glob "!.git/*"'

    " Open new buffers from fzf
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

    let g:fzf_layout = { 'down': '40%' }

    " Customize fzf colors to match your color scheme
    " - fzf#wrap translates this to a set of `--color` options
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    " Mappings for file finder and fuzzy search
    nnoremap <silent> <leader>t :Files<CR>
    nnoremap <silent> <leader>b :Buffers<CR>
    nnoremap <silent> <leader>m :History<CR>

    " Use our own search instead of built :Rg so we don't follow links
    nnoremap <leader>f :Rg<space>
  " }}}

  " vim-eunuch {{{
    Plug 'tpope/vim-eunuch'                    " Helpers for unix commands (mv, cp, rename)
    nnoremap <Leader><Leader>r :Rename<space>
  " }}}

  " vim-test {{{
    Plug 'janko-m/vim-test'                 " Runs tests from vim for variety of languages and frameworks

    let test#strategy = 'neovim'            " Don't use fullscreen panel for tests

    nnoremap <silent> <leader>R :w<CR> :TestNearest<CR>
    nnoremap <silent> <leader>r :w<CR> :TestFile<CR>
    nnoremap <silent> <leader>a :w<CR> :TestSuite<CR>
    nnoremap <silent> <leader>l :w<CR> :TestLast<CR>
    nnoremap <silent> <leader>g :w<CR> :TestVisit<CR>
  " }}}
" }}}

" Language Configuration {{{
  Plug 'tpope/vim-markdown'                    " Markdown syntax support
  Plug 'tpope/vim-haml'                        " HAML syntax support
  Plug 'mustache/vim-mustache-handlebars'      " Mustache/handlebars syntax support

  Plug 'hail2u/vim-css3-syntax'                " CSS3 syntax support
  Plug 'cakebaker/scss-syntax.vim'             " SASS syntax support

  Plug 'elzr/vim-json'                         " Better JSON syntax support

  Plug 'aklt/plantuml-syntax'                  " PlantUML syntax support
  let g:vim_json_syntax_conceal = 0

  " Operations {{{
    Plug 'chr4/nginx.vim'                      " nginx config syntax support
    Plug 'hashivim/vim-packer'                 " Packer syntax support
    Plug 'hashivim/vim-terraform'              " Terraform syntax support

    Plug 'towolf/vim-helm'                     " Helm Charts syntax support
    Plug 'pearofducks/ansible-vim'             " Ansible syntax support
  " }}}

  " Ruby on Rails {{{
    Plug 'tpope/vim-rails'                     " Rails syntax and vim tooling
    Plug 'tpope/vim-rake'                      " Rake syntax support
    Plug 'vim-ruby/vim-ruby'                   " Ruby syntax support
  " }}}

  " JavaScript and TypeScript {{{
    Plug 'HerringtonDarkholme/yats.vim'        " TypeScript
    Plug 'yuezk/vim-js'                        " JavaScript
    Plug 'maxmellon/vim-jsx-pretty'            " TSX and JSX
    Plug 'jparise/vim-graphql'                 " GraphQL syntax support including within tags
  " }}}

  " Go {{{
    Plug 'fatih/vim-go'                        " Go syntax and tooling support

    let g:go_fmt_command = 'goimports'
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
  " }}}
" }}}

" Completion and Linting {{{
  " COC {{{
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " List of extensions.
    let g:coc_global_extensions = [
      \  'coc-css',
      \  'coc-eslint',
      \  'coc-git',
      \  'coc-highlight',
      \  'coc-html',
      \  'coc-json',
      \  'coc-prettier',
      \  'coc-solargraph',
      \  'coc-stylelint',
      \  'coc-tsserver',
      \  'coc-yaml']

    let g:coc_user_config = {
      \  "eslint.autoFixOnSave": "true",
      \  "git.addedSign.text": "┃",
      \  "git.addedSign.hlGroup": "DiffAdded",
      \  "git.changedSign.hlGroup": "DiffLine",
      \  "git.changedSign.text": "┃",
      \  "git.changeRemovedSign.text": "-",
      \  "git.removedSign.hlGroup": "DiffRemoved",
      \  "git.changeRemovedSign.hlGroup": "DiffRemoved",
      \  "git.topRemovedSign.hlGroup": "DiffRemoved",
      \  "highlight.document.enable": "true",
      \  "highlight.colors.enable": "true",
      \  "highlight.colorNames.enable": "true",
      \  "solargraph.promptDownload": "false",
      \  "yaml.format.enable": "true",
      \  "coc.preferences.colorSupport": "true",
      \  "coc.preferences.formatOnSaveFiletypes": ["markdown", "javascript", "javascript.jsx", "typescript", "typescript.tsx", "ruby", "yaml"]
      \ }

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> for trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` for navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Use K for show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if &filetype == 'vim'
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Remap <C-c> as it breaks COC
    nmap <C-c> <ESC>
    imap <C-c> <ESC>
    vmap <C-c> <ESC>
    omap <C-c> <ESC>

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for scrolling popup window
    nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

    " Configure coc-highlight
    autocmd CursorHold * silent call CocActionAsync('highlight')
  " }}}
" }}}

call plug#end()

" Theme {{{
  " base16-shell 256 colour support
  let base16colorspace=256
  colorscheme base16-tomorrow-night
" }}}

" COC Colours {{{
  " Set colours after theme otherwise they get overwritten
  highlight link CocErrorHighlight Underlined
  highlight link CocWarningHighlight WarningMsg
  highlight link CocInfoFloat NormalFloat
  highlight link CocHintFloat NormalFloat
  highlight! link CocHighlightText Search
  highlight! link CocHighlightRead Search
  highlight! link CocHighlightWrite Search
" }}}
