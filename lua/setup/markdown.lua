local render_markdown = {
  heading = {
    icons = { "󰎥 ", "󰎨 ", "󰎫 ", "󰎲 ", "󰎯 ", "󰎴 " },
  },
  latex = { converter = "latex2text" },
}

require("mkdnflow").setup {}
require("render-markdown").setup(render_markdown)
