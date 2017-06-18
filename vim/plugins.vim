" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1            " Use tags files.
let g:ycm_seed_identifiers_with_syntax = 1                   " Use identifiers from syntax files.
let g:ycm_collect_identifiers_from_comments_and_strings = 1  " Use identifiers from comments
let g:ycm_complete_in_comments = 1                           " Also complete within comments
let g:ycm_python_binary_path = '/usr/local/bin/python3'

" Pymode
let g:pymode_options = 0
let g:pymode_folding = 0
let g:pymode_run = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_checkers = []


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
" Don't hide quotes in JSON.
let g:vim_json_syntax_conceal = 0

" fzf
" Use ag to obey ignore files
let $FZF_DEFAULT_COMMAND='ag --ignore "*.log" --ignore ".git" --hidden -g ""'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" vim-test
let test#strategy = 'neovim'

" neomake
let g:neomake_python_enabled_makers = []
autocmd! BufWritePost * Neomake
