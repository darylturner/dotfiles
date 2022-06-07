-- remap some builtins
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- trim whitespace
vim.keymap.set({"v", "n"}, "<leader>wt", [[:%s/\s\+$//e<cr>]])

-- quick underline
vim.keymap.set("n", "<leader>uu", [[:s/./-/g<cr>]])
vim.keymap.set("n", "<leader>uU", [[:s/./=/g<cr>]])

-- quick comment
vim.keymap.set({"v", "n"}, "<leader>cc", [[:s/^/#/<cr>]])
vim.keymap.set({"v", "n"}, "<leader>cd", [[:s/^#//<cr>]])

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
