" vim: set fen fdm=marker

" General {{{1
set noswapfile
set nocompatible
syntax enable
filetype plugin on
set modeline
set number
set relativenumber
set numberwidth=4
set wildmode=longest,list,full
set winaltkeys=no
set timeoutlen=200
set ttimeoutlen=0
set esckeys

" Spacing {{{1
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=2
set shiftwidth=2

" Misc {{{1
nnoremap ; :

augroup Whitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
