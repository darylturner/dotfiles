vim.cmd "colorscheme nord"

vim.cmd [[
    hi! link TSString String
    hi! link TSField SpecialComment

    highlight CursorLineNR ctermfg=white
    highlight StatusLine cterm=none ctermfg=none ctermbg=none
    highlight StatusLineNC cterm=none ctermfg=blue ctermbg=none
    highlight VertSplit ctermfg=blue ctermbg=none gui=none
]]

vim.cmd "ab jbr {%- %}"
vim.cmd "ab jcom {#- #}"
