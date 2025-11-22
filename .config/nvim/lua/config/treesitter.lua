require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "rust",
    "python",
    "java",
    "c",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "svelte",
    "c_sharp",
    "kotlin",
    "elixir",
    "xml",
    "go",
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
})

