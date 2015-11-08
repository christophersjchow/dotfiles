" Ignore log files.
let g:ag_prg="ag --column --smart-case --ignore \"*.log\""

" From last search
nnoremap <silent> <leader>as :AgFromSearch<CR>

" Bind a key for quick searching
nnoremap <leader>f :Ag<space>
