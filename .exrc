set number
set tabstop=4
set showmatch
set shiftwidth=4
set autoindent
set searchincr
set cedit=

map gg 1G
map gt {!}align-table
map ge :%!expand -t 4

map gfp :%!yapf
map gfg :%!gofmt

map gx !'mtmux load-buffer -
map gy !'mtmux load-buffer -u
map gp :r!tmux show-buffer
map gX !'mpbcopy
map gY !'mpbcopyu
map gP :r!pbpaste
