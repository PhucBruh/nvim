return {

  ---@Plug-editor-hop Fast and efficient search and jump engine within buffers
  -- Allows quick navigation and search using a hop-based approach
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function() require("hop").setup {} end,
  },

  ---@Plug-editor-file-explorer
  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "Oil" },
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = function() require "setup.explorer" end,
  },

  ---@Plug-editor-telescope Fuzzy finder for Neovim
  -- Provides a powerful and customizable fuzzy finding interface for lists and files
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  ---@Plug-editor-autopairs Automatic pairing of characters
  -- Automatically handles pairing of parentheses, brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter", "CmdlineEnter" },
    config = true,
  },

  ---@Plug-editor-complete Autocompletion plugin for Neovim
  -- Provides completion suggestions for various sources, enhanced with snippets
  {
    "hrsh7th/nvim-cmp", -- Completion plugin
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path", -- Path source for nvim-cmp
      "hrsh7th/cmp-cmdline", -- Cmdline source for nvim-cmp

      -- for luasnip and preset snippets
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",

      "onsails/lspkind.nvim", --Better look
    },
    config = function() require "setup.cmp" end,
  },

  ---@Plug-editor-comment Simplified commenting of code
  -- Provides easy-to-use commenting functionality for various code types
  {
    "numToStr/Comment.nvim",
  },

  ---@Plug-editor-comment Highlight and manage TODO comments
  -- Helps in managing and highlighting TODO comments in code
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  ---@Plug-editor-'nvim-ufo' Enhanced folding for Neovim
  -- Provides advanced code folding features for better code navigation
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = { "kevinhwang91/promise-async" },
    config = function() require "setup.ufo" end,
  },

  ---@Plug-editor-'better-escape' Improved escape sequences for insert mode
  -- Enhances the escape behavior to improve efficiency and comfort
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      timeout = 300,
      default_mappings = false,
      mappings = {
        i = { j = { k = "<Esc>", j = "<Esc>" } },
      },
    },
  },

  ---@Plug-editor-'nvim-surround' Easily manage surrounding characters
  -- Provides functions for adding, changing, and deleting surrounding characters
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },
}
