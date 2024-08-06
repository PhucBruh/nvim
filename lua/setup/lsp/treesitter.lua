local configs = {
  ensure_installed = {
    "c",
    "css",
    "html",
    "http",
    "json",
    "jsonc",
    "jsdoc",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "rust",
    "sql",
    "toml",
    "vim",
    "vimdoc",
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true,
}

require("nvim-treesitter.configs").setup(configs)
