return require("packer").startup(function()
    use "wbthomason/packer.nvim"

    -- completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip" -- for luasnips completion engine

    -- snippets
    use "l3mon4d3/luasnip"

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

    -- commentary
    use "tpope/vim-commentary"

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

    -- org-ish mode
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        }
                    },
                    -- ["core.gtd.base"] = {},
                    ["core.norg.dirman"] = {
                        config = {
                            workspaces = {
                                work = "~/notes/work",
                                home = "~/notes/home",
                            }
                        }
                    },
                    -- ["core.norg.concealer"] = {},
                }
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }
end)
