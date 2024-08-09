local opts = {
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    lua = { "stylua" },
    json = { "jq" },
    markdown = { "prettierd" },
    hmtl = { "prettierd" },
    xml = { "prettierd" },
    graphql = { "prettierd" },
    java = { "google-java-format" },
  },
}

require("conform").setup(opts)

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function() require("go.format").goimports() end,
  group = format_sync_grp,
})
