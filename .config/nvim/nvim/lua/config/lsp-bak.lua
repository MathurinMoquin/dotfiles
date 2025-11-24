local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Auto Setup
local servers = {
  "rust_analyzer",
  "pyright",
  "html",
  "cssls",
  "ts_ls",
  "emmet_ls",
  "kotlin_language_server",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

-- Emmet (HTML, CSS, JS, TS, REACT)
lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
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
    }
})

-- Omnisharp (C#)
lspconfig["omnisharp"].setup({
    capabilities = capabilities,
    cmd = {
        vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
    },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
})

-- Clangd (C/C++)
lspconfig["clangd"].setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--compile-commands-dir=/path/to/your/project"
  },
})

-- ElixirLS (Elixir)
lspconfig.elixirls.setup({
  capabilities = capabilities,
  cmd = {
    vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/release/language_server.sh",
  },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
})
