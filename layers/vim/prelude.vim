" vim: set fen fdm=marker

" General {{{1
set noswapfile
set nocompatible
set hidden
syntax enable
filetype plugin indent on
set modeline
set number
set relativenumber
set backspace=indent,eol,start
set numberwidth=4
set wildmode=longest,list,full
set winaltkeys=no

" Spacing {{{1
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=2
set shiftwidth=2

set t_Co=256

" Invisible chars {{{1
set list
set listchars=tab:>-,trail:~

" Misc {{{1
nnoremap ; :

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

augroup Whitespace
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END
set eol
