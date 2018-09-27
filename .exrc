set number
set tabstop=4
set showmatch
set shiftwidth=4
set autoindent
set searchincr
set showmode
set cedit=

"code snippets
"jinja2
ab jfor {%- for x in y %}{%- endfor %}
ab jif {%- if x == y %}{%- endif %}

"key maps
map gg 1G
"code formatting
map gt {!}align-table
map ge :%!expand -t 4
map gfp :%!yapf
map gfg :%!gofmt
"tmux yanking
map gx !'mtmux load-buffer -
map gy !'mtmux load-buffer -u
map gp :r!tmux show-buffer
"macos yanking
map gX !'mpbcopy
map gY !'mpbcopyu
map gP :r!pbpaste
