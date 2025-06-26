return {
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        default_integrations = true,
        transparent_background = true,
      })
      vim.cmd("colorscheme catppuccin")
    end,
    integrations = {
      cmp = true,
      treesitter = true,
      gitsigns = true,
      bufferline = false,
      snacks = {
        enabled = true,
        indent_scope_color = "",
      },
    },
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
