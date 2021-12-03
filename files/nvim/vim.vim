"== tabline navigation ==
nnoremap <c-S-tab> :bprevious<CR>
nnoremap <c-tab>   :bnext<CR>
nnoremap <leader>bf :buffers<CR>:buffer  
nnoremap <leader>bd :bd<CR>
"== press Ctrl-J whenever you want to split a line ==
nnoremap <NL> i<CR><ESC>
"== netrw ==
nnoremap <leader>e :Explore<CR>

"== blink cursor ==
:set guicursor=a:blinkon100

"== copy to clipboard
map <F2> :w !pbcopy<CR><CR>
"== paste from clipboard
map <F3> :r !pbpaste<CR>
