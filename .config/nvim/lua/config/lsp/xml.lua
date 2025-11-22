-- lua/config/lsp/xml.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.lemminx.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  filetypes = { 'xml' },
  root_dir = lspconfig.util.root_pattern("pom.xml", "build.xml", "settings.gradle"),
})
