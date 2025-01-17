return {
  "tpope/vim-dadbod",
  specs = {
    {
      "kristijanhusak/vim-dadbod-ui",
      dependencies = { "tpope/vim-dadbod" },
      event = "VeryLazy",
      init = function() require "setup.full-dadbob" end,
    },
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      dependencies = {
        {
          "kristijanhusak/vim-dadbod-completion",
          dependencies = {
            "AstroNvim/astrocore",
            opts = {
              autocmds = {
                dadbod_cmp = {
                  {
                    event = "FileType",
                    desc = "dadbod completion",
                    pattern = { "sql", "mysql", "plsql" },
                    callback = function()
                      require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
                    end,
                  },
                },
              },
            },
          },
        },
      },
    },
  },
}
