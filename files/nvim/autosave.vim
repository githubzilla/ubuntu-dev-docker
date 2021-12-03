"== autosave ==
let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save = 0
"augroup ft_autosave
  "au!
  "au FileType markdown let b:auto_save = 1
  "au FileType c let b:auto_save = 1
  "au FileType cpp let b:auto_save = 1
  "au FileType rs let b:auto_save = 1
  "au FileType vim let b:auto_save = 1
"augroup END
set updatetime=1000 " small updatetime for auto save work more smooth with auto_save_event includes CursorHold
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHold", "CursorHoldI"]
