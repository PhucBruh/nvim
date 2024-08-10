return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
    opst = {
      heading = {
        position = "inline",
        icons = { "󰼏 ", "󰎨 ", "󰼑 ", "󰎲 ", "󰼓 ", "󰎴 " },
        signs = { "󰫍 ", "󰫎 ", "󰫍 ", "󰫎 ", "󰫍 ", "󰫎 " },
      },

      code = {
        position = "right",
        width = "block",
      },

      checkbox = {
        unchecked = {
          -- Replaces '[ ]' of 'task_list_marker_unchecked'
          icon = "✘ ",
          -- Highlight for the unchecked icon
          highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          -- Replaces '[x]' of 'task_list_marker_checked'
          icon = "✔ ",
          -- Highligh for the checked icon
          highlight = "RenderMarkdownChecked",
        },
      },

      pipe_table = {
        border = { "╭", "┬", "╮", "├", "┼", "┤", "╰", "┴", "╯", "│", "─" },
      },

      latex = {
        enabled = false,
      },
    },
  },
}
