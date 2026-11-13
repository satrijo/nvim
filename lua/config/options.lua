-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use pyright for Python LSP (more stable)
vim.g.lazyvim_python_lsp = "pyright"

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"
