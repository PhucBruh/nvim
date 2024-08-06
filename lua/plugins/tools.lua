return {

  ---@Plug-tools-database
  -- Database
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function() require "setup.dadbod" end,
  },

  ---@Plug-tools-'kulala'
  -- HTTP REST-Client Interface
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    config = function() require "setup.kulala" end,
  },

  ---@Plug-tools-obsidian
  -- Note taking
  {
    "epwalsh/obsidian.nvim",
    ft = "markdown",
    dependencies = {
      -- The markdown work flow
      "jakewvincent/mkdnflow.nvim",

      -- Better render markdown UI in neovim
      "MeanderingProgrammer/render-markdown.nvim",
    },
    config = function() require "setup.obsidian" end,
  },
}
