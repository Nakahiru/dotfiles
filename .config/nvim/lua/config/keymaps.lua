-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local discipline = require("wulnar.discipline")
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- disable in visual block mode
vim.keymap.set("n", "<M-j>", "<Nop>")
vim.keymap.set("i", "<M-j>", "<Nop>")
vim.keymap.set("v", "<M-j>", "<Nop>")
vim.keymap.set("n", "<M-k>", "<Nop>")
vim.keymap.set("i", "<M-k>", "<Nop>")
vim.keymap.set("v", "<M-k>", "<Nop>")

-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)

--  re center view each time using search or <C-d> <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>cu", vim.cmd.UndotreeToggle)

-- map jj shortcut key as escape key in insert mode
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")

-- delete a word backwards
vim.keymap.set("n", "dw", 'vb"_d')

-- select all
-- vim.keymap.set('n', '<C-a>', 'gg<S-v>G')
vim.keymap.set("n", "<leader>a", "gg<S-v>G")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
