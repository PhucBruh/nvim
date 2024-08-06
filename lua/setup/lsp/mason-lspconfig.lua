local opts = {
  ensure_installed = { "lua_ls" },
}

require("mason-lspconfig").setup(opts)
