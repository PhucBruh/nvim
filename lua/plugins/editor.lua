return {

  ---@Plug-editor-hop
  -- Search and jump engine in buffer
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function() require("hop").setup {} end,
  },

  ---@Plug-editor-telescope
  -- fuzzy finder over lists for neovim
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  ---@Plug-editor-autopairs
  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter", "CmdlineEnter" },
    config = true,
  },

  ---@Plug-editor-complete
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

  ---@Plug-editor-comment
  {
    "numToStr/Comment.nvim",
  },

  ---@Plug-editor-comment
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  ---@Plug-editor-'nvim-ufo'
  -- For folding stuff
  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = { "kevinhwang91/promise-async" },
    config = function() require "setup.ufo" end,
  },

  ---@Plug-editor-'better-escape'
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
}
