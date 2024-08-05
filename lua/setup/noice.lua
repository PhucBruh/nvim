local opts = {
  -- views = {
  --   mini = {
  --     win_options = {
  --       winblend = 0,
  --     },
  --   },
  -- },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    {
      filter = { event = "notify", find = "No information available" },
      opts = { skip = true },
    },
  },
  presets = {
    lsp_doc_border = true,
  },
}

require("noice").setup(opts)