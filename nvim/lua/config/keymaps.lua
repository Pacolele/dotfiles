-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-n>", "<CMD>Neotree focus <CR>", { desc = "switch to neotree focus" })
vim.keymap.set("n", "<C-m>", "<CMD>Neotree toggle <CR>", { desc = "Toggling neotree" })
