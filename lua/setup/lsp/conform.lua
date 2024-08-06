local opts = {
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    lua = { "stylua" },
    markdown = { "prettierd" },
  },
}

require("conform").setup(opts)
