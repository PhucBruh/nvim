return {
  {
    -- HTTP REST-Client Interface
    "mistweaverco/kulala.nvim",
    ft = "http",
    config = function() require "setup.kulala-nvim" end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      vim.filetype.add {
        extension = {
          ["http"] = "http",
        },
      }
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "http" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "jqls" })
    end,
  },
}
