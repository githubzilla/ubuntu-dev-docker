"== far ==
set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

" shortcut for far.vim find
nnoremap <silent> <space>farf  :Farf<cr>
vnoremap <silent> <space>farf  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <space>farr  :Farr<cr>
vnoremap <silent> <space>farr  :Farr<cr>
