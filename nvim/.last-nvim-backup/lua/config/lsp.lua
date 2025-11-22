local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "rust_analyzer",
  "pyright",
  "clangd",
  "html",
  "cssls",
  "ts_ls",
  "emmet_ls",
  "kotlin",
  --"lemminx",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

lspconfig["emmet_ls"].setup({
    capabilities = capabilities,
    filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
    }
})

lspconfig["omnisharp"].setup({
    capabilities = capabilities,
    cmd = {
        vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp",
        "--languageserver",
        "--hostPID", tostring(vim.fn.getpid()),
    },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
})

lspconfig["clangd"].setup({
  cmd = { "clangd", "--compile-commands-dir=/path/to/your/project" },
})

lspconfig.kotlin_language_server.setup({
})

lspconfig.elixirls.setup{
    cmd = { "/home/math/.local/share/nvim/mason/packages/elixir-ls/release/language_server.sh" }
}

-- local mason_path = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh"
-- 
-- lspconfig.elixirls.setup{
--     cmd = { mason_path },
--     settings = {
--         elixirLS = {
--             dialyzerEnabled = false,
--             fetchDeps = false,
--         },
--     },
-- }
