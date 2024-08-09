return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    lspconfig.gopls.setup({})
    lspconfig.jqls.setup({})
    lspconfig.sqlls.setup({
      filetypes = { "sql", "mysql" },
    })
  end,
}
