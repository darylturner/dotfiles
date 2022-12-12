-- remap some builtins
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- trim whitespace
vim.keymap.set({"v", "n"}, "<leader>wt", [[:%s/\s\+$//e<cr>]])

-- quick underline
vim.keymap.set("n", "<leader>uu", [[:s/./-/g<cr>]])
vim.keymap.set("n", "<leader>uU", [[:s/./=/g<cr>]])

-- toggle side bar
vim.keymap.set("n", "<leader>n", require("functions").toggleSideBar)

-- tmux
vim.keymap.set("v", "<leader>ty", "!tmux load-buffer -<cr>u")

-- telescope keymaps
vim.keymap.set("n", "<c-p>", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics)

-- dap
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", function()
    local cond = vim.fn.input('breakpoint condition: ')
    require("dap").set_breakpoint(cond)
end)
vim.keymap.set("n", "<leader>dd", require("dap").continue)
vim.keymap.set("n", "<leader>dn", require("dap").step_over)
vim.keymap.set("n", "<leader>ds", require("dap").step_into)
vim.keymap.set("n", "<leader>dS", require("dap").step_out)
vim.keymap.set("n", "<leader>du", require("dapui").toggle)

-- fugitive
vim.keymap.set("n", "<leader>gs", ":Git<cr>")
vim.keymap.set("n", "<leader>gP", ":Git push<cr>")
vim.keymap.set("n", "<leader>gp", ":Git pull --commit<cr>")
vim.keymap.set("n", "<leader>ga", ":Git add %<cr>")
vim.keymap.set("n", "<leader>gc", ":Git commit<cr>")
vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<cr>")

-- user commands
vim.api.nvim_create_user_command('ToggleSideBar', require("functions").toggleSideBar, {})
