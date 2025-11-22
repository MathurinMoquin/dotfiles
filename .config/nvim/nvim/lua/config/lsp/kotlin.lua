-- lua/config/lsp/kotlin.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.kotlin_language_server.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  cmd = { "kotlin-language-server" },
  filetypes = { 'kotlin' },
  root_dir = lspconfig.util.root_pattern("build.gradle", "settings.gradle"),
})
