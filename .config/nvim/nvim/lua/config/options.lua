vim.opt.clipboard = 'unnamedplus'     	-- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'                   	-- allow the mousw to be used in Nvim

-- Tab
vim.opt.tabstop = 4 					-- number of visual spaces per TAB
vim.opt.softtabstop = 4 				-- number of spacesin tab when editing
vim.opt.shiftwidth = 4 					-- insert 4 spaces on a tab
vim.opt.expandtab = true 				-- tabs are spaces, mainly because of python
vim.opt.autoindent = true
vim.opt.smartindent = true

-- UI config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true 		    -- enable 24-bit RGB color in the TUI

-- Seaching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
