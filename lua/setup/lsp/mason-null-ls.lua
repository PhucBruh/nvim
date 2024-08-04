local opts = {
  ensure_installed = {
    "stylua",
    "jq",
  },
}

require("mason-null-ls").setup(opts)
