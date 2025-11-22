local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
  local opts =  { noremap = true, silent = true, buffer = bufnr }
  -- Go to Definition
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- Info (popup)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- Rename all occurences
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- Code actions (refactors, quick fixes)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

return M
