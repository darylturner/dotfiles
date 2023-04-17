-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    -- completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "saadparwaiz1/cmp_luasnip" },
    { "l3mon4d3/luasnip" },

    -- telescope
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local ts = require("telescope")
            ts.setup {
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                    }
                }
            }
            ts.load_extension("fzf")
        end,
    },

    -- colourschemes
    { "shaunsingh/nord.nvim", lazy = false, priority = 1000, },

    -- lsp
    { "neovim/nvim-lspconfig" },

    -- dap
    { "mfussenegger/nvim-dap", ft = "go" },
    {
        "leoluz/nvim-dap-go",
        config = function() require("dap-go").setup() end,
        ft = "go",
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function() require("dapui").setup() end,
        ft = "go",
    },
    { "nvim-telescope/telescope-dap.nvim" },

    -- treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-treesitter/playground" },

    -- git
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },
    { "shumphrey/fugitive-gitlab.vim" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
                    delay = 1000,
                },
            }
        end
    },

    -- commment
    {
        "numtostr/comment.nvim",
        config = function()
            require('Comment').setup()
        end
    },

    -- surround
    { "tpope/vim-surround" },
})
