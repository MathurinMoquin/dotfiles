require('core.lazy')
require('config.lsp')
require('config.cmp')
require('config.treesitter')
require('config.options')
require('config.keymaps')



-- NERDTree
vim.cmd [[
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
]]

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- Check if NERDTree is the only window open
        if vim.fn.winnr('$') == 1 and vim.bo.filetype == "nerdtree" then
            vim.cmd("quit")
        end
    end
})

