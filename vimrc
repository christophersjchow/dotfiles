" vim:set filetype=vim foldmethod=marker foldlevel=1

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

  set encoding=utf8                            " Always use unicode.
  set spelllang=en_au                          " Set spell check language.
  set shortmess=aIoO                           " Show short messages, no intro.

  set hidden                                   " Allow hidden buffers.
  set history=100                              " Size of command history.
  set confirm                                  " Enable error files & error jumping.
  set autoread                                 " Automatically reload changes if detected

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
    set undodir=~/.vim/undo
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
  set t_vb=

  set updatetime=300                           " Smaller update time for CursorHold & CursorHoldI
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
  set modeline                                 " Enable reading modelines
  set modelines=1                              " Only read single modelines

  set foldmethod=marker                        " Fold based on syntax
  set foldlevelstart=99                        " Start with all folds open
  set foldnestmax=10                           " Deepest fold is 10 levels
  set nofoldenable                             " Don't fold by default
  set foldlevel=1

  if exists('+colorcolumn')
    set colorcolumn=120
    highlight colorcolumn ctermbg=236 guibg=#262D51
  endif

  " LightLine {{{
      Plug 'chriskempson/base16-vim'           " Theme
      Plug 'itchyny/lightline.vim'             " Statusbar
      Plug 'mike-hearn/base16-vim-lightline'   " Statusbar theme
      Plug 'ryanoasis/vim-devicons'            " Icons for statusbar and other plugins

      let g:lightline = {
      \   'colorscheme': 'base16_tomorrow_night',
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['cocstatus', 'readonly', 'filetype', 'filename']
      \     ],
      \     'right': [
      \       ['percent'], ['lineinfo'],
      \       ['gitbranch'],
      \       ['fileformat', 'fileencoding'],
      \       ['linter_errors', 'linter_warnings']]
      \   },
      \   'component_expand': {
      \     'linter': 'LightlineLinter',
      \     'linter_warnings': 'LightlineLinterWarnings',
      \     'linter_errors': 'LightlineLinterErrors',
      \     'linter_ok': 'LightlineLinterOk'
      \   },
      \   'component_type': {
      \     'readonly': 'error',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error'
      \   },
      \   'component_function': {
      \     'fileencoding': 'LightlineFileEncoding',
      \     'filename': 'LightlineFileName',
      \     'fileformat': 'LightlineFileFormat',
      \     'filetype': 'LightlineFileType',
      \     'gitbranch': 'LightlineGitBranch',
      \     'cocstatus': 'coc#status'
      \   },
      \   'tabline': {
      \     'left': [['tabs']],
      \     'right': [['close']]
      \   },
      \   'tab': {
      \     'active': ['filename', 'modified'],
      \     'inactive': ['filename', 'modified'],
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' }
      \ }

      function! LightlineFileName() abort
          let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
          if filename =~ 'NERD_tree'
              return ''
          endif
          let modified = &modified ? ' +' : ''
          return fnamemodify(filename, ":~:.") . modified
      endfunction

      function! LightlineFileEncoding()
          " only show the file encoding if it's not 'utf-8'
          return &fileencoding == 'utf-8' ? '' : &fileencoding
      endfunction

      function! LightlineFileFormat()
          " only show the file format if it's not 'unix'
          let format = &fileformat == 'unix' ? '' : &fileformat
          return winwidth(0) > 70 ? format . ' ' . WebDevIconsGetFileFormatSymbol() : ''
      endfunction

      function! LightlineFileType()
          return WebDevIconsGetFileTypeSymbol()
      endfunction

      function! LightlineLinter() abort
          let l:counts = ale#statusline#Count(bufnr(''))
          return l:counts.total == 0 ? '' : printf('×%d', l:counts.total)
      endfunction

      function! LightlineLinterWarnings() abort
          let l:counts = ale#statusline#Count(bufnr(''))
          let l:all_errors = l:counts.error + l:counts.style_error
          let l:all_non_errors = l:counts.total - l:all_errors
          return l:counts.total == 0 ? '' : '⚠ ' . printf('%d', all_non_errors)
      endfunction

      function! LightlineLinterErrors() abort
          let l:counts = ale#statusline#Count(bufnr(''))
          let l:all_errors = l:counts.error + l:counts.style_error
          return l:counts.total == 0 ? '' : '✖ ' . printf('%d', all_errors)
      endfunction

      function! LightlineLinterOk() abort
          let l:counts = ale#statusline#Count(bufnr(''))
          return l:counts.total == 0 ? 'OK' : ''
      endfunction

      function! LightlineGitBranch()
          return "\uE725 " . (exists('*fugitive#head') ? fugitive#head() : '')
      endfunction
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
  nnoremap K k
  vnoremap K k

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
  Plug 'tpope/vim-fugitive'                    " Git commands in vim
  Plug 'tpope/vim-sleuth'                      " Detect indent style
  Plug 'tpope/vim-commentary'                  " Comment code using vim motions
  Plug 'tpope/vim-surround'                    " Deal with surrounding text elements (quotes, parenthenses)
  Plug 'tpope/vim-repeat'                      " Support using dot operator for other plugins
  Plug 'pbrisbin/vim-mkdir'                    " Automatically create directories when creating new buffers

  " vim-signify {{{
    Plug 'mhinz/vim-signify'

    let g:signify_vcs_list = ['git']
    let g:signify_sign_add               = '┃'
    let g:signify_sign_delete            = '-'
    let g:signify_sign_delete_first_line = '_'
    let g:signify_sign_change = '┃'
  " }}}

  " Fuzzy Finder and Search (FZF) {{{
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    " Override the default command with ripgrep to include all files
    let $FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --glob "!.git/*"' 

    " Text search using ripgrep
    command! -bang -nargs=* Search
      \ call fzf#vim#grep(
      \   'rg --column --color=always --no-heading --smart-case --hidden --glob "!.git/*" '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
    " Use git for default fuzzy find
    command! -bang -nargs=? -complete=dir GitFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

    " Open new buffers from fzf
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

    " Mappings for file finder and fuzzy search
    nnoremap <silent> <leader>t :GitFiles --cached --others --exclude-standard<CR>
    nnoremap <silent> <leader>T :Files<CR>
    nnoremap <silent> <leader>b :Buffers<CR>

    " Use our own search instead of built :Rg so we don't follow links
    nnoremap <leader>f :Search<space>
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

  Plug 'hail2u/vim-css3-syntax'                " CSS3 syntax support
  Plug 'cakebaker/scss-syntax.vim'             " SASS syntax support

  Plug 'elzr/vim-json'                         " Better JSON syntax support
  let g:vim_json_syntax_conceal = 0

  " Operations {{{
    Plug 'chr4/nginx.vim'                      " nginx config syntax support
    Plug 'hashivim/vim-hashicorp-tools'        " HashiCorp tools (Vagrant, Terraform, Consul etc) syntax support
  " }}}

  " Ruby on Rails {{{
    Plug 'tpope/vim-rails'                     " Rails syntax and vim tooling
    Plug 'tpope/vim-rake'                      " Rake syntax support
    Plug 'vim-ruby/vim-ruby'                   " Ruby syntax support
  " }}}

  " JavaScript and TypeScript {{{
    Plug 'othree/yajs.vim'                     " JavaScript (ES6, ES7, ES8) syntax support
    Plug 'othree/es.next.syntax.vim'           " JavaScript ESNext syntax support
    Plug 'jparise/vim-graphql'                 " GraphQL syntax support including within tags
    Plug 'mxw/vim-jsx'                         " JSX syntax support
    Plug 'HerringtonDarkholme/yats.vim'        " TypeScript syntax support
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
  " ale {{{
    let g:ale_completion_enabled = 0       " Disable completion before loading ale

    Plug 'w0rp/ale'

    let g:ale_set_highlights = 0
    let g:ale_change_sign_column_color = 0
    let g:ale_sign_error = '✖'
    let g:ale_sign_warning = '⚠'
    let g:ale_echo_msg_error_str = '✖'
    let g:ale_echo_msg_warning_str = '⚠'
    let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'

    let g:ale_linters = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['tslint', 'prettier'],
      \ 'typescript.tsx': ['tslint', 'prettier'] }
    let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'typescript': ['tslint'],
      \ 'typescript.tsx': ['tslint'],
      \ 'javascript': ['eslint'] }
    let g:ale_javascript_prettier_use_local_config = 1
    let g:ale_fix_on_save = 0
  " }}}

  " COC {{{
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

    " Customise symbols for status bar (does not affect gutter)
    let g:coc_status_error_sign = '⚠ '
    let g:coc_status_warning_sign = '⚠ '

    " List of extensions.
    let g:coc_global_extensions = [
      \  'coc-css',
      \  'coc-html',
      \  'coc-json',
      \  'coc-stylelint',
      \  'coc-tag',
      \  'coc-tsserver']

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

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
  " }}}
" }}}

call plug#end()

" Theme {{{
  " base16-shell 256 colour support
  let base16colorspace=256
  colorscheme base16-tomorrow-night
" }}}
