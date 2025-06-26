local M = {}

M.capabilities = require("cmp-nvim_lsp").default_capabilities()
vim.lsp.set_log_level("warn")

M.on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set(keys, func, desc, { buffer = bufnr, desc = desc })
  end
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = 0 })
  nmap("K", vim.lsp.buf.hover, "Hover documentation")

  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("gd", vim.lsp.buf.definition, "[G]oto definition")
  nmap("gD", "<cmd>vsplit | lua vim.lsp.buf.definitiion()<CR>", "Open definition in vertical split")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>Ic", vim.lsp.buf.incoming_calls, "[I]ncoming [C]alls")
  nmap("<leader>Oc", vim.lsp.buf.outgoing_calls, "[O]utgoing [C]alls")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto references")
  nmap("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynaminc_workspace_symbols, "Workspace symbols")
end

return M
