-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set leader to ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Disable relative line numbers
vim.opt.relativenumber = false

-- Reset conceallevel to default
vim.opt.conceallevel = 0

-- Set undodir
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")
