-- LSP and LS Installer
require("nvim-dap-virtual-text").setup({})
local lspconfig = require("lspconfig")
local def = require("lsp-conig")
lspconfig.lua_ls.setup({
  autostart = true,
  capabilities = def.capabilities,
  on_attach = def.on_attach,
  signatureHelp = { enable = true },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      hint = { enable = true },
      signatureHelp = { enable = true },
    },
  },
})

lspconfig.pylsp.setup({
  autostart = true,
  capabilities = def.capabilities,
  on_attach = def.on_attach,
  settings = {
    pylsp = {
      plugins = {
        -- Enable the django plugin
        django = { enabled = true },
        -- Optionally, disable conflicting plugins if needed:
        pycodestyle = { enabled = false },
        -- pyflakes = { enabled = false },
        -- pydocstyle = { enabled = false },
        -- You can also adjust other plugins like jedi_completion:
        jedi_completion = { fuzzy = true },
      },
    },
  },
})
-- local nvim_lsp = require("lspconfig")
-- lspconfig.terraformls.setup({})
-- lspconfig.tflint.setup({})
-- nvim_lsp.denols.setup({
--   on_attach = def.on_attach,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- })
--
-- nvim_lsp.ts_ls.setup({
--   on_attach = def.on_attach,
--   root_dir = nvim_lsp.util.root_pattern("package.json"),
--   single_file_support = false,
-- })
