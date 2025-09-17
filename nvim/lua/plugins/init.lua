return {
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },

  { "fwcd/kotlin-language-server" },

  -- ESP IDF
  { "Aietes/esp32.nvim" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  { "Hoffs/omnisharp-extended-lsp.nvim" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
   -- Mason and related plugins
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "pyright",
          "clangd",
          "html",
          "cssls",
          "ts_ls",
          "emmet_ls",
          "omnisharp",
        },
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig", -- Required for LSP setup
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",  -- lazy load when entering insert mode
    config = function()
	require("nvim-autopairs").setup({
      	  check_ts = true, -- enable Treesitter integration
      	  fast_wrap = {},
      	  disable_filetype = { "TelescopePrompt", "vim" },
    })
    end,
    },
    -- Elixir
    {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      nextls = {enable = true},
      elixirls = {
        enable = true,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      },
      projectionist = {
        enable = true
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
},
  -- Java ecosystem
  { "nvim-java/lua-async-await" },
  { "nvim-java/nvim-java-core" },
  { "nvim-java/nvim-java-test" },
  { "nvim-java/nvim-java-dap" },
  { "nvim-java/nvim-java-refactor" },
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "nvim-java/nvim-java-refactor",
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim", -- optional, for formatting/linting
    },
    config = function()
      require("java").setup()
    end,
    ft = { "java" },
  },
}
