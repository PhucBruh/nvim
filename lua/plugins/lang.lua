return {

  ---@Plug-lang-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require "setup.lsp.treesitter" end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }
    end,
  },

  ---@Plug-lang-mason
  -- Mason integration with LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function() require "setup.lsp.mason-lspconfig" end,
  },

  -- Mason integration with null-ls
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function() require "setup.lsp.mason-null-ls" end,
  },

  -- LSPConfig for configuring LSP servers
  {
    "neovim/nvim-lspconfig",
    config = function() require "setup.lsp.lspconfig" end,
  },

  ---@Plug-lang-conform
  -- Formatter config
  {
    "stevearc/conform.nvim",
    config = function() require "setup.lsp.conform" end,
  },
}
