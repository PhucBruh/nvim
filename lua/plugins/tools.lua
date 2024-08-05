return {
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

  -- HTTP REST-Client Interface
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    config = function() require "setup.kulala" end,
  },

  -- Markdown support
  {
    "MeanderingProgrammer/markdown.nvim",
    ft = "markdown",
    main = "render-markdown",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = {
      "jakewvincent/mkdnflow.nvim",
    },
    config = function() require "setup.markdown" end,
  },
}
