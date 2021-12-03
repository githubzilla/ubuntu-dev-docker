" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <expr> <leader>fF ':Telescope find_files<cr>' . expand('<cword>')
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <expr> <leader>fG ':Telescope live_grep<cr>' . expand('<cword>')
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <expr> <leader>fS ':Telescope grep_string<cr>' . expand('<cword>')
