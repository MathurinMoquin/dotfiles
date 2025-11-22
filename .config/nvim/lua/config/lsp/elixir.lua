-- lua/config/lsp/elixir.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.elixirls.setup({
  capabilities = capabilities,
  cmd = {
    vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh",
  },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
})
