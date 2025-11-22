-- ~/.config/nvim/lua/plugins/nerdtree.lua
return {
  "preservim/nerdtree",
  cmd = "NERDTreeToggle", -- Lazy load only when needed
  keys = {
    { "<leader>e", "<cmd>NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
  },
}

