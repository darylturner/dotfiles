vim.cmd "colorscheme nord"

    -- hi! link TSString String
    -- hi! link TSField SpecialComment

vim.cmd [[
    "highlight CursorLineNR ctermfg=white 
    highlight StatusLine cterm=none ctermfg=none ctermbg=none guibg=none
    highlight StatusLineNC cterm=none ctermfg=blue ctermbg=none guibg=none guifg=#8FBCBB
    highlight VertSplit ctermfg=blue ctermbg=none guibg=none guifg=#8FBCBB
]]

vim.cmd "ab jbr {%- %}"
vim.cmd "ab jcom {#- #}"
