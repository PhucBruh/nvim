local vaults = {
  {
    name = "notes",
    path = "~/Workspace/notes",
  },
}
require("mkdnflow").setup {}
require("render-markdown").setup {
  heading = {
    -- Turn on / off heading icon & background rendering
    enabled = true,
    -- Turn on / off any sign column related rendering
    sign = true,
    -- Determines how the icon fills the available space:
    --  inline: underlying '#'s are concealed resulting in a left aligned icon
    --  overlay: result is left padded with spaces to hide any additional '#'
    position = "inline",
    -- Replaces '#+' of 'atx_h._marker'
    -- The number of '#' in the heading determines the 'level'
    -- The 'level' is used to index into the array using a cycle
    icons = { "󰼏 ", "󰎨 ", "󰼑 ", "󰎲 ", "󰼓 ", "󰎴 " },
    -- Added to the sign column if enabled
    -- The 'level' is used to index into the array using a cycle
    signs = { "󰫍 ", "󰫎 ", "󰫍 ", "󰫎 ", "󰫍 ", "󰫎 " },
    -- Width of the heading background:
    --  block: width of the heading text
    --  full: full width of the window
    width = "full",
    -- The 'level' is used to index into the array using a clamp
    -- Highlight for the heading icon and extends through the entire line
    backgrounds = {
      "RenderMarkdownH1Bg",
      "RenderMarkdownH2Bg",
      "RenderMarkdownH3Bg",
      "RenderMarkdownH4Bg",
      "RenderMarkdownH5Bg",
      "RenderMarkdownH6Bg",
    },
    -- The 'level' is used to index into the array using a clamp
    -- Highlight for the heading and sign icons
    foregrounds = {
      "RenderMarkdownH1",
      "RenderMarkdownH2",
      "RenderMarkdownH3",
      "RenderMarkdownH4",
      "RenderMarkdownH5",
      "RenderMarkdownH6",
    },
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
    -- Whether LaTeX should be rendered, mainly used for health check
    enabled = false,
    -- Executable used to convert latex formula to rendered unicode
    converter = "latex2text",
    -- Highlight for LaTeX blocks
    highlight = "RenderMarkdownMath",
    -- Amount of empty lines above LaTeX blocks
    top_pad = 0,
    -- Amount of empty lines below LaTeX blocks
    bottom_pad = 0,
  },
}

-- Define highlight groups
vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = "#FF0000" }) -- Example color for unchecked
vim.api.nvim_set_hl(0, "RenderMarkdownChecked", { fg = "#00FF00" }) -- Example color for checked

require("obsidian").setup {
  completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },
  workspaces = vaults,
  ui = { enable = false },
}
