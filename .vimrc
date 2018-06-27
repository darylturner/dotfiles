syntax on
set number
set expandtab
set shiftwidth=4
set tabstop=4
set mouse=
set textwidth=0
set wrapmargin=0
set wrap
set linebreak

let mapleader = ","

highlight LineNr ctermfg=white
highlight VertSplit cterm=none gui=none

noremap <C-\> :NERDTreeToggle<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1

call plug#begin('~/.vim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'saltstack/salt-vim', { 'for': [ 'sls', 'j2', 'jinja' ] }
Plug 'ClockworkNet/vim-junos-syntax', { 'for': 'junos' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sonph/auto-pairs', { 'for': ['python', 'go'] }
call plug#end()
