autocmd BufNewFile,BufRead *.ru
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=ruby |
      \ else |
      \   setf ruby |
      \ endif