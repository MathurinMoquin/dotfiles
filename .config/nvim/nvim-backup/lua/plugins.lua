local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "blink.cmp",                 -- Blink completion
    'nvim-java/nvim-java',
    "hrsh7th/nvim-cmp",          -- Completion plugin
    "hrsh7th/cmp-nvim-lsp",      -- LSP source for nvim-cmp
    "neovim/nvim-lspconfig",     -- LSP configurations
    "hrsh7th/cmp-buffer",        -- Buffer completions
    "hrsh7th/cmp-path",          -- Path completions
    "hrsh7th/cmp-cmdline",       -- Command line completions
    "saadparwaiz1/cmp_luasnip",  -- Snippet completions
    "L3MON4D3/LuaSnip",          -- Snippet engine
    "preservim/nerdtree",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
	},
	-- LSP manager
	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = { "pylsp" },
		},
	},
--    {
--        "saghen/blink.cmp",
--        dependencies = { "rafamadriz/friendly-snippets" },
--
--        version = "*",
--
--        opts = {
--            keymap = {
--                preset = "enter",
--                -- Select completions
--                ["<Up>"] = { "select_prev", "fallback" },
--                ["<Down>"] = { "select_next", "fallback" },
--                ["<Tab>"] = { "select_next", "fallback" },
--                ["<S-Tab>"] = { "select_prev", "fallback" },
--
--                -- Scroll documentation
--                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
--                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
--
--                -- Show/hide signature
--                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
--            },
--
--            appearance = {
--                nerd_font_variant = "mono",
--            },
--
--            sources = {
--                default = { "lsp", "path", "snippets", "buffer" },
--            },
--
--            fuzzy = { implementation = "prefer_rust_with_warning" },
--            completion = {
--                keyword = { range = "prefix" },
--                menu = {
--                    draw = { 
--                        treesitter = { "lsp" },
--                    }
--                },
--                trigger = { show_on_trigger_character = true },
--                documentation = {
--                    auto_show = true,
--                },
--            },
--
--            signature = { enabled = true },
--        },
--        opts_extend = { "sources.default" },
--    }
})

-- Optional: Set additional options for the theme
require("catppuccin").setup({
    flavour = "macchiato", -- Choose from "latte", "frappe", "macchiato", "mocha"
    transparent_background = true, -- Set to true for a transparent background
    -- Add more options as needed
})
