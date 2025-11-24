local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "rust_analyzer",
    "pyright",
    "clangd",
    "html",
    "cssls",
    "ts_ls",
    "emmet_ls",
    "omnisharp",
    "kotlin_language_server",
    "elixirls",
    "lemminx",
    "gopls",
    "bashls",
  },
  automatic_installation = true,
})

-- Languages
require("config.lsp.rust")
require("config.lsp.python")
require("config.lsp.c_cpp")
require("config.lsp.html_css_js")
require("config.lsp.kotlin")
require("config.lsp.csharp")
require("config.lsp.elixir")
require("config.lsp.go")
require("config.lsp.bash")
