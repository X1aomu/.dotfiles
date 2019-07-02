if has("unix")
  set guifont=Hack\ 12
elseif has("win32") || has("win64")
  set guifont=Consolas:h12
endif
" toolbar
set guioptions-=T
" menubar
set guioptions-=m
" left-hand scrollbar
set guioptions-=l
set guioptions-=L
" right-hand scrollbar
set guioptions-=r
set guioptions-=R
" autoselect
set guioptions+=a
" use console dialog
set guioptions+=c
" use tabline instead of guitablabel
set guioptions-=e
" don't auto resize window size
set guioptions+=k

set columns=108
set lines=36

autocmd GuiEnter * silent exec "!transset -a 0.50"

" vim: set et ts=2 sw=2 :
