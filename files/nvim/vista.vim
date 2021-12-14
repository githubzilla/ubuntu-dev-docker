function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
"autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'nvim_lsp'

nnoremap <leader>v <cmd>Vista <cr>
nnoremap <leader>vc <cmd>Vista! <cr>
nnoremap <leader>vt <cmd>Vista!! <cr>
