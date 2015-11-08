" Ignore log files.
let g:ag_prg="ag --column --smart-case --ignore \"*.log\""

nnoremap <silent> <leader>as :AgFromSearch<CR> " From last search
nnoremap <leader>a :Ag<space>                  " Bind a key for quick searching
