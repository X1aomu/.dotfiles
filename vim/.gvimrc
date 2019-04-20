if has("unix")
  set guifont=Hack\ 11
elseif has("win32") || has("win64")
  set guifont=Consolas:h11
endif
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L
set guioptions+=a
set guioptions+=c
set columns=108
set lines=48

autocmd GuiEnter * silent exec "!transset -a 0.50"

" vim: set et ts=2 sw=2 :
