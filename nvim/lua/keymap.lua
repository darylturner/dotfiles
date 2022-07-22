-- custom functions
myfuncs = {
    toggleSideBar = function(opts)
        if vim.opt.number._value == true then
            vim.opt.number = false
            vim.opt.signcolumn = "no"
        else
            vim.opt.number = true
            vim.opt.signcolumn = "yes:2"
        end
    end,
}

-- remap some builtins
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- trim whitespace
vim.keymap.set({"v", "n"}, "<leader>wt", [[:%s/\s\+$//e<cr>]])

-- quick underline
vim.keymap.set("n", "<leader>uu", [[:s/./-/g<cr>]])
vim.keymap.set("n", "<leader>uU", [[:s/./=/g<cr>]])

-- toggle side bar
vim.keymap.set("n", "<leader>n", myfuncs.toggleSideBar)

-- tmux
vim.keymap.set("v", "<leader>ty", [["+y]])
vim.keymap.set("n", "<leader>tp", [["+p]])
vim.keymap.set("n", "<leader>tP", [["+P]])

-- telescope keymaps
vim.keymap.set("n", "<c-p>", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)

-- fugitive
vim.keymap.set("n", "<leader>gs", ":Git<cr>")
vim.keymap.set("n", "<leader>gP", ":Git push<cr>")
vim.keymap.set("n", "<leader>gp", ":Git pull --commit<cr>")
vim.keymap.set("n", "<leader>ga", ":Git add %<cr>")
vim.keymap.set("n", "<leader>gc", ":Git commit<cr>")
vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<cr>")

-- user commands
vim.api.nvim_create_user_command('ToggleSideBar', myfuncs.toggleSideBar, {})
