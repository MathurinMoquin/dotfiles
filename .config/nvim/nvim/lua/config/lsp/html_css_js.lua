-- lua/config/lsp/html_css_js.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

local servers = { "html", "cssls", "ts_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = common.capabilities,
    on_attach = common.on_attach,
  })
end

lspconfig.emmet_ls.setup({
  capabilities = common.capabilities,
  on_attach = common.on_attach,
  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "less",
    "sass",
    "scss",
  },
})
