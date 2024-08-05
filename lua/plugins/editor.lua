return {

  -- Search and jump engine in buffer
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function() require("hop").setup {} end,
  },

  -- fuzzy finder over lists for neovim
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter", "CmdlineEnter" },
    config = true,
  },

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

      "kristijanhusak/vim-dadbod-completion", -- For db support

      "onsails/lspkind.nvim", --Better look
    },
    config = function() require "setup.cmp" end,
  },

  {
    "numToStr/Comment.nvim",
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
