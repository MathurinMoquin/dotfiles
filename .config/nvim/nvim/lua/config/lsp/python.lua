-- lua/config/lsp/python.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.pyright.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attach,
})
