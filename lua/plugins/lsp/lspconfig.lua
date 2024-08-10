return {
  "neovim/nvim-lspconfig",
  dependencies = { "SmiteshP/nvim-navic" },
  config = function()
    local lspconfig = require("lspconfig")
    local navic = require("nvim-navic")
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
    end

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    lspconfig.gopls.setup({
      on_attach = on_attach,
    })

    lspconfig.jqls.setup({})

    lspconfig.taplo.setup({
      on_attach = on_attach,
    })
  end,
}
