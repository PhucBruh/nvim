local opts = {
  ensure_installed = {
    "lua_ls",
    "gopls",
    "jqls",
    "sqlls",
  },
}

require("mason-lspconfig").setup(opts)
