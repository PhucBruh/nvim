local opts = {
  override = {
    http = {
      icon = "",
      name = "http",
      color = "#cc252a",
    },
  },
}

require("nvim-web-devicons").setup(opts)

vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}
