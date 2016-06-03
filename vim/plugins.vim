" YouCompleteMe

let g:ycm_collect_identifiers_from_tags_files = 1            " Use tags files.
let g:ycm_seed_identifiers_with_syntax = 1                   " Use identifiers from syntax files.
let g:ycm_collect_identifiers_from_comments_and_strings = 1  " Use identifiers from comments
let g:ycm_complete_in_comments = 1                           " Also complete within comments
let g:ycm_python_binary_path = '/usr/local/bin/python'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Pymode
let g:pymode_folding = 0
let g:pymode_run = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 0
let g:pymode_lint = 0

" vim-rails

" Set ctags command so that tags are supported by YouCompleteMe
let g:rails_ctags_arguments = ['--languages=-javascript', '--fields=+l', '--exclude=.git', '--exclude=log']

" When not in a Rails project, vim-rails doesn't highlight RSpec files. Do it manually.
if !exists(":Rails!")
  function! SyntaxForRspec()
    syn keyword rubyRailsTestMethod describe context it its specify shared_context shared_examples shared_examples_for shared_context include_examples include_context it_should_behave_like it_behaves_like before after around subject fixtures controller_name helper_name scenario feature background given described_class
    syn match rubyRailsTestMethod '\<let\>!\='
    syn keyword rubyRailsTestMethod violated pending expect expect_any_instance_of allow allow_any_instance_of double instance_double mock mock_model stub_model xit
    syn match rubyRailsTestMethod '\.\@<!\<stub\>!\@!'
    highlight def link rubyRailsTestMethod Function
  endfunction

  au BufNewFile,BufRead *_spec.rb call SyntaxForRspec()
endif

" rust.vim
let g:rustfmt_autosave = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_theme='base16'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" yajs
let g:vim_json_syntax_conceal = 0                           " Don't hide quotes in JSON.

" fzf
" Use ag to obey ignore files
let $FZF_DEFAULT_COMMAND='ag --ignore "*.log" --ignore ".git" --hidden -g ""'

" Custom ag function so we can pass command line options
function! s:ag_with_opts(arg, bang)
  let tokens  = split(a:arg)
  let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
  let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
  call fzf#vim#ag(query, '--ignore "*.log" --ignore ".git" --hidden', a:bang ? {} : {'down': '40%'})
endfunction

autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" vim-test
let test#strategy = 'neovim'

" neomake
autocmd! BufWritePost * Neomake
