local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", function()
  telescope.find_files({ cwd = vim.env.HOME })
end, { desc = "Find files in home directory" })
