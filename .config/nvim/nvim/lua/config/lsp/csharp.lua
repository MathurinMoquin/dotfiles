-- lua/config/lsp/csharp.lua

local lspconfig = require("lspconfig")
local common = require("config.lsp.common")

lspconfig.omnisharp.setup({
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

