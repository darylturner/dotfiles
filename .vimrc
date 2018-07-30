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
autocmd BufNewFile,BufRead *.sls set filetype=yaml

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

"cuz i'm hardcore
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"colour faffing
highlight LineNr ctermfg=gray
highlight StatusLine cterm=underline ctermfg=lightgray ctermbg=none
highlight StatusLineNC cterm=none,underline ctermfg=cyan ctermbg=none
highlight EndOfBuffer ctermfg=none ctermbg=none
highlight VertSplit cterm=none gui=none

"third-party plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-dirvish'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sonph/auto-pairs', { 'for': ['python', 'go'] }
call plug#end()
