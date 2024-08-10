return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "SmiteshP/nvim-navic" },
  event = { "BufRead", "WinLeave" },
  config = function()
    require("plugins.ui.lualine.setup")
  end,
}
