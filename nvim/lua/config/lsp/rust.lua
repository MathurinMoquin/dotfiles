-- lua/config/lsp/rust.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.rust_analyzer.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attach,
})
