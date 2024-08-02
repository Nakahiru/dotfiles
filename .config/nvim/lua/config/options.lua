-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- enable spell checking
opt.spelllang = "en_us"
opt.spell = true
opt.incsearch = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wrap = true
opt.pumblend = 0 -- transparency cmp
opt.conceallevel = 0

vim.g.lazyvim_prettier_needs_config = true
