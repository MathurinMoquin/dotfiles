-- lua/config/lsp/c_cpp.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.clangd.setup({
  capabilities = common.capabilities,
  cmd = {
    "clangd",
    "--compile-commands-dir=/path/to/your/project"
  },
})
