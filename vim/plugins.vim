" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_theme='base16'

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" yajs
" Don't hide quotes in JSON.
let g:vim_json_syntax_conceal = 0

" vim-jsx
let g:jsx_ext_required = 0

" fzf
let $FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --color=always --no-heading --smart-case --hidden --follow --glob "!.git/*" '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" vim-test
let test#strategy = 'neovim'

" ale
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'ruby': ['rubocop'],
\}
