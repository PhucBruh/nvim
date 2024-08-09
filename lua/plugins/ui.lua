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
    event = { "BufRead", "WinLeave" },
    dependencies = {
      "letieu/harpoon-lualine",
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
    config = function() require "setup.lualine" end,
  },
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  ---@Plug-UI-anyline
  -- indent line
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
      "rcarriga/nvim-notify",
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
