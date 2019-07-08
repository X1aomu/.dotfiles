let mapleader = "\<Space>"

"===== Section Start =====
" vim-plug               |
"=========================

if has("unix")
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')
" colorthemes
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
" editing
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" look
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
" lang
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'ambv/black', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug '~/.vim/plugged/YouCompleteMe' " YCM isn't managed by vim-plug this way
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_global_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" other
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

"====== Section End ======
" vim-plug               |
"=========================

map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
imap <C-K><c-o> :pyf /usr/share/clang/clang-format.py<cr>

" first of all
set nocompatible

" look
set ruler
set number
set cursorcolumn
set showcmd
set laststatus=2

" searching
set hlsearch
set ignorecase smartcase
set incsearch

" navigation
set scrolloff=1
set backspace=indent,eol,start " allow backspacing over everything
set whichwrap=b,s,<,>,[,]
set wrap

" misc
set history=1000
set autoindent
set modeline
set modelines=3

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" color scheme
set background=light
let g:solarized_extra_hi_groups = 1
colorscheme solarized8
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

syntax on

if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!
    " When editing a file, always jump to the last known cursor position.
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END " vimrcEx
endif " has("autocmd")

if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set nobackup    " keep a backup file (restore to previous version)
  set undofile  " keep an undo file (undo changes after closing)
endif

if has('mouse')
  set mouse=a
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

set fileencodings=usc-bom,utf-8,default,gb18030,cp936,latin1
" vim: set et ts=2 sw=2 :
