-- ~/.config/nvim/lua/plugins/nerdtree.lua
return {
  "preservim/nerdtree",
  cmd = "NERDTreeToggle", -- Lazy load only when needed
  keys = {
    { "ge", "<cmd>NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
  },
  config = function()
    vim.g.NERDTreeQuitOnOpen = 1
    
    -- Add Shift+Enter mapping in NERDTree
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "nerdtree",
      callback = function()
        -- Map Shift+Enter to behave like Enter
        vim.keymap.set('n', '<S-CR>', '<CR>:NERDTreeToggle<CR>', { buffer = true, remap = true, silent = true })
      end,
    })
  end
}

