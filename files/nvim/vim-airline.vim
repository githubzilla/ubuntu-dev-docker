"== tabline setting
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

"== airline themes ==
set cursorline
set background=dark

let g:airline_theme='material'
let g:material_theme_style = 'darker'
colorscheme material
hi Normal       ctermbg=NONE guibg=NONE
hi SignColumn   ctermbg=235 guibg=#262626
hi LineNr       ctermfg=grey guifg=grey ctermbg=NONE guibg=NONE
hi CursorLineNr ctermbg=NONE guibg=NONE ctermfg=178 guifg=#d7af00
