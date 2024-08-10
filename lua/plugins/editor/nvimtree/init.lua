return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  version = "*",
  lazy = false,
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    require("plugins.editor.nvimtree.setup")
  end,
}
