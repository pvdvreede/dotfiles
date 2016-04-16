" cant use fish for vim shell so set to bash
set shell=bash

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" General VIM ----------- {{{
" make our leader key be space
let mapleader=" "
filetype on
filetype plugin on
filetype indent on

set t_ut= " improve screen clearing by using the background color
syntax enable
set enc=utf-8
set background=dark
set t_Co=256
" in case t_Co alone doesn't work, add this as well:
" i.e. Force 256 colors harder
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

colorscheme molokai

set nocompatible
set showcmd

set noswapfile
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/
" searching
set ignorecase
set incsearch
set hlsearch

set paste

" highlight the current line and column
set cul
set cuc

set relativenumber
set number

" Tab specific option
set expandtab
set tabstop=4
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
"}}}

" GUI Gvim -------- {{{
" no toolbar
set guioptions-=T
" no menu
set guioptions-=m
" no scrollbars
set guioptions-=r
set guioptions-=b
set guioptions-=l
"}}}

" netrw -------- {{{
map <leader>k :Explore<cr>
let g:netrw_liststyle=3
"}}}

" Mappings ---------------- {{{
" remap colon to semicolon to avoid the shift
nnoremap ; :
" Redraw my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Add a line while in Normal mode
nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j

nnoremap <Leader>t :CtrlP<cr>
nnoremap <Leader>b :CtrlPBuffer<cr>
"}}}

" Autocommands ------------ {{{
augroup filetype_all
  " clear whitespace at the end of a line for EVERY filetype
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_tmux
    autocmd!
    autocmd FileType tmux setlocal foldmethod=marker
augroup END

augroup numbering
  autocmd!
  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber
augroup END
"}}}

" Status line ------------ {{{

set laststatus=2

" Left side
set statusline=%.20F
set statusline+=\ \  " separator
set statusline+=%2*%m%*
set statusline+=\ \  " separator
set statusline+=%y
set statusline+=%=


set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
" Right side
set statusline+=\ [line\ %l\/%L]
"}}}

" Plugin: CTRL-P -------- {{{
" ctrl-p setup
let g:ctrlp_match_window_bottom = 1    " Show at bottom of window
let g:ctrlp_working_path_mode = 'ra'   " Our working path is our VCS project or the current directory
let g:ctrlp_mru_files = 1              " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2         " Jump to tab AND buffer if already open
let g:ctrlp_open_multiple_files = '2hj' " opens multiple selections in vertical splits to the right
let g:ctrlp_arg_map = 0
let g:ctrlp_dotfiles = 1               " do show (.) dotfiles in match list
let g:ctrlp_showhidden = 0             " do not show hidden files in match list
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 40            " restrict match list to a maxheight of 40
let g:ctrlp_use_caching = 0            " don't cache, we want new list immediately each time
let g:ctrlp_max_files = 500
let g:ctrlp_working_path_mode = ''
let g:ctrlp_dont_split = 'NERD_tree_2' " don't split these buffers
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep)$',
      \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|ctags|gitattributes)$'
      \ }
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co'] " if you want to use git for this rather than ag
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-e>', '<c-space>'],
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ 'AcceptSelection("r")': ['<cr>'],
      \ 'AcceptSelection("v")': ['<c-v>'],
      \ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
      \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
      \ 'PrtHistory(-1)':       ['<c-n>'],
      \ 'PrtHistory(1)':        ['<c-p>'],
      \ 'ToggleFocus()':        ['<c-tab>'],
      \}
"}}}

" Plugin: easyalign ------- {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}

" Plugin: rainbow parenthesis ------- {{{
" Rainbow parenthesis
let g:rainbow_active=1
"}}}

" Plugin: easy-motion ----------- {{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-overwin-f2)

" JK motions: Line motions
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
"}}}

" Plugin: Airline -------------- {{{
let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" }}}

