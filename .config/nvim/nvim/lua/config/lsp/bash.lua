-- lua/config/lsp/bash.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.bashls.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attach,
})
