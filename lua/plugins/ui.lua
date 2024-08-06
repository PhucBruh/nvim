return {

  ---@Plug-UI-'alpha-nvim'
  -- dashboard intro
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    config = function() require "setup.alpha" end,
  },

  ---@Plug-UI-'nvim-tree'
  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require "setup.nvim-tree" end,
  },

  ---@Plug-UI-'nvim-web-devicons'
  -- more icons
  {
    "nvim-sree/nvim-web-devicons",
    opts = function() require "setup.nvim-web-devicons" end,
  },

  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinLeave" },
  -- },

  ---@Plug-UI-catppuccin
  -- just a theme
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function() require "setup.catpuccin" end,
  },

  ---@Plug-UI-lualine
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
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

  {
    "huy-hng/anyline.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
    event = "VeryLazy",
    opts = {
      animation = "none",
    },
  },

  ---@Plug-UI-statuscol
  {
    "lewis6991/gitsigns.nvim",
    event = "WinLeave",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "luukvbaal/statuscol.nvim",
    branch = "0.10",
    config = function() require "setup.statuscol" end,
  },

  ---@Plug-UI-noice
  -- for notification and some ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "j-hui/fidget.nvim",
    },
    config = function() require "setup.noice" end,
  },

  ---@Plug-UI-'nvim-highlight-colors'
  -- highlight color
  {
    "brenoprata10/nvim-highlight-colors",
    config = function() require("nvim-highlight-colors").setup {} end,
  },

  ---@Plug-UI-'which-key'
  -- keybind descripion
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
}
