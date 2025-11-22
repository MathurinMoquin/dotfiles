-- lua/config/lsp/go.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.gopls.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attach,
})
