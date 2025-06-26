-- bootstrap lazy.nvim, LazyVim and your plugins
require("pakko.core")
require("pakko.lazy")

if vim.g.vscode then
  -- VSCode Neovim
  require("pakko.vscode_keymaps")
else
  -- Ordinary Neovim
end
