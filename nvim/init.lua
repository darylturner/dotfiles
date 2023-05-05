-- bootstrap package manager
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

-- set leader before calling plugins.lua so that keymaps are correct
vim.g.mapleader = " "

require("plugins")
require("options")
require("ft")
require("vim_cmd")
require("keymap")
require("completion")
require("lsp")
require("treesitter")
