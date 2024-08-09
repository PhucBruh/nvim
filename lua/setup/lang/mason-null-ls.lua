local opts = {
  ensure_installed = {
    "stylua",
    "jq",
    "prettierd",
    "xmlint",
    "google-java-format",
    "sql-formatter",
  },
}

require("mason-null-ls").setup(opts)
