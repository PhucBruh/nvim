local opts = {
  ensure_installed = {
    "stylua",
    "jq",
    "prettierd",
  },
}

require("mason-null-ls").setup(opts)
