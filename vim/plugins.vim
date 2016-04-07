" YouCompleteMe

let g:ycm_collect_identifiers_from_tags_files = 1            " Use tags files.
let g:ycm_seed_identifiers_with_syntax = 1                   " Use identifiers from syntax files.
let g:ycm_collect_identifiers_from_comments_and_strings = 1  " Use identifiers from comments
let g:ycm_complete_in_comments = 1                           " Also complete within comments
let g:ycm_python_binary_path = '/usr/local/bin/python'

" " ag.vim
let g:ag_prg="ag --column --smart-case --ignore \"*.log\""   " Ignore log files.

" CtrlP

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_max_height = 10                                   " Ensure max height isn't too large (for performance)
let g:ctrlp_reuse_window = 'startify'                         " Fix new windows opening in split from startify
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'       " Use ag
  let g:ctrlp_use_caching = 0                                 " ag is fast enough that CtrlP doesn't need to cache
endif

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
let $FZF_DEFAULT_COMMAND='ag -g ""'                         " Use ag to obey ignore files

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" vim-test
let test#python#runner = 'tox'
let test#strategy = 'neovim'

" neomake
autocmd! BufWritePost * Neomake
