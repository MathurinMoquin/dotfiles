return {
   -- Mason and LSP
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
          "lua_ls",
          "rust_analyzer",
          "pyright",
          "clangd",
          "html",
          "cssls",
          "ts_ls",
          "emmet_ls",
          "omnisharp",
          "kotlin_language_server",
        },
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig", -- Required for LSP setup
    config = function()
        require("config.lsp")
    end
  },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
    
  -- Autopairs
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

  -- ESP IDF
  { "Aietes/esp32.nvim" },

  -- C#
  { "Hoffs/omnisharp-extended-lsp.nvim" },

  -- Elixir
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        nextls = { enable = false }, -- Use ElixirLS
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = true,
          },
          cmd = {
            vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh",
          },
        },
      }
    end,
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

  -- XML
  { "honza/vim-snippets" },
  { "rafamadriz/friendly-snippets" },
  { "alaviss/nim.nvim", ft = {"xml"} },

  -- Kotlin
  { "udalov/kotlin-vim", ft = "kotlin" },
}
