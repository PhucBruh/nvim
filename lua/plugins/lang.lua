return {

  ---@Plug-lang-'treesitter' for syntax highlighting and code manipulation
  -- Provides parser support and code highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require "setup.lang.treesitter" end,
  },

  ---@Plug-lang-'mason' for managing LSP servers, formatters, and linters
  -- Package management for LSP servers and additional tools
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

  ---@Plug-lang-'mason-lspconfig' for automatical configures and installs LSP servers using Mason
  -- Integrates with `mason.nvim` to manage LSP server setups
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function() require "setup.lang.mason-lspconfig" end,
  },

  -- Manages formatters and linters using Mason
  -- Integrates with `null-ls` for additional tooling
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function() require "setup.lang.mason-null-ls" end,
  },

  -- Configures LSP clients and server settings
  -- Essential setup for LSP server configuration
  {
    "neovim/nvim-lspconfig",
    config = function() require "setup.lang.lspconfig" end,
  },

  ---@Plug-lang-conform for formatting and linting
  -- Provides configuration for formatters and linters
  {
    "stevearc/conform.nvim",
    config = function() require "setup.lang.conform" end,
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
