"standard vim configuration
set number
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set mouse=
set background=dark
set laststatus=1
set syntax=on

"extra extensions to filetypes
autocmd BufNewFile,BufRead *.sls set filetype=yaml ts=2 sw=2

"map leader key to spacebar
map <Space> <Leader>

"map escape key to terminal normal mode
tnoremap <Esc> <C-\><C-n>

"leader key stuff
"version control
noremap <Leader>gs :Gstatus<CR>
"toggles
noremap <Leader>tn :set invnumber<CR>
noremap <Leader>tf :set foldmethod=indent<CR>

"colour faffing
highlight LineNr ctermfg=gray
highlight VertSplit cterm=none gui=none

"status-line configuration
let g:airline_powerline_fonts=1
let g:airline_theme='minimalist'

"third-party plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-dirvish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sonph/auto-pairs', { 'for': ['python', 'go'] }
call plug#end()
