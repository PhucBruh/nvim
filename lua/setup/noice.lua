local notify = require "notify"

-- Configure nvim-notify
notify.setup {
  -- Set the background color of the notifications
  timeout = 500,
  -- Set the maximum width and height of notifications
  max_width = 60,
  max_height = 10,

  -- Set the position of the notifications
  stage = "fade",

  -- Customize the border
  render = "minimal", -- Choose 'minimal' for a clean look
  top_down = false,
}

-- Set up notify to use for messages
vim.notify = notify

local opts = {
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
  commands = {
    enabled = false, -- Disable command output
  },
}

require("noice").setup(opts)
