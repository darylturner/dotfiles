return require("packer").startup(function()
    use "wbthomason/packer.nvim"

    -- telescope
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
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
        end
    }

    -- colourschemes
    use { "arcticicestudio/nord-vim", tag = "develop" }

    -- syntax
    use "glench/vim-jinja2-syntax"
    use "saltstack/salt-vim"
    use "clockworknet/vim-junos-syntax"

    -- lspconfig
    use "neovim/nvim-lspconfig"

    -- git integrations
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    -- surround plugin
    use "tpope/vim-surround"

    -- treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- gitsigns
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
          "nvim-lua/plenary.nvim"
        },
        tag = "release",
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
    }
end)
