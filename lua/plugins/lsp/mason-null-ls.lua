return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "stylua",
      "jq",
      "prettierd",
      "xmlint",
      "google-java-format",
      "sql-formatter",
    },
  },
}
