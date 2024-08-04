return {
  -- dashboard intro
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    config = function() require "setup.alpha" end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function() require "setup.nvim-tree" end,
  },

  -- more icons
  {
    "nvim-tree/nvim-web-devicons",
    opts = function() require "setup.nvim-web-devicons" end,
  },

  -- just colorscheme
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function() vim.cmd.colorscheme "tokyonight" end,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() require "setup.catpuccin" end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "letieu/harpoon-lualine",
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
    config = function() require "setup.lualine" end,
  },

  -- for notification and some ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function() require "setup.noice" end,
  },

  -- highlight color
  {
    "brenoprata10/nvim-highlight-colors",
    config = function() require("nvim-highlight-colors").setup {} end,
  },

  -- keybind descripion
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
