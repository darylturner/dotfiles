-- global scoped
vim.g.mapleader = " "

-- misc
vim.opt.background = "dark"
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 1
vim.opt.mouse = ""
vim.opt.guicursor = ""
vim.opt.equalalways = false
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright= true
vim.opt.tabstop = 8
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.updatetime = 750
vim.opt.numberwidth = 4
vim.opt.foldlevel = 10
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.signcolumn = "yes:2"
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.wrap = false
vim.opt.inccommand = "split"
vim.opt.spelllang = "en_gb,en_us"

-- custom statusline
vim.opt.fillchars = {
    diff = "-",
    fold = " ",
    stl = "-",
    stlnc = "-",
    vert = "|",
}
vim.opt.statusline = "%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P"

-- autocommands
vim.api.nvim_create_autocmd("FileType", {
    pattern = "norg",
    callback = function()
        -- vim.opt.foldmethod = "marker" -- folding now built into norg treesitter
        vim.opt.foldlevel = 2
    end,
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sls",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt.shiftwidth = 8
    end,
})

