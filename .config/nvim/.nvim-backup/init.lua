require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')

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


--local cmp = require('cmp')

--cmp.setup({
--    snippet = {
--        expand = function(args)
--            require('luasnip').lsp_expand(args.body) -- For LuaSnip users
--        end,
--    },
--    mapping = {
--        ['<C-n>'] = cmp.mapping.select_next_item(),
--        ['<C-p>'] = cmp.mapping.select_prev_item(),
--        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--    },
--    sources = {
--        { name = 'nvim_lsp' },
--        { name = 'buffer' },
--        { name = 'path' },
--        { name = 'cmdline' },
--        { name = 'luasnip' },
--    },
--})
