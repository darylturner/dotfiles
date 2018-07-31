"standard vim configuration
set number
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set mouse=
set background=dark
set laststatus=2
set syntax=on

"statusline faffing
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:-
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

"extra extensions to filetypes
autocmd BufNewFile,BufRead *.sls set filetype=yaml ts=2 sw=2

"map leader key to spacebar
map <Space> <Leader>

"leader key stuff
"version control
noremap <Leader>gs :Gstatus<CR>
"toggles
noremap <Leader>tn :set invnumber<CR>
noremap <Leader>tf :set foldmethod=indent<CR>

"because habits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"colour faffing
highlight LineNr ctermfg=gray
highlight StatusLine cterm=none,bold ctermfg=white ctermbg=none
highlight StatusLineNC cterm=none ctermfg=gray ctermbg=none
highlight EndOfBuffer ctermfg=none ctermbg=none
highlight VertSplit cterm=none gui=none

"third-party plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-dirvish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sonph/auto-pairs', { 'for': ['python', 'go'] }
call plug#end()
