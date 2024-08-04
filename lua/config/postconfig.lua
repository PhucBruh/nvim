vim.api.nvim_set_hl(0, "YankHighlight", {
  bg = "#ff9900", -- Change this to your desired background color
  fg = "#ffffff", -- Change this to your desired foreground color (text color)
  blend = 20, -- Optional: adjust the transparency (0-100)
})

-- Autocmd to clear the highlight after a delay (optional)
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank {higroup="YankHighlight", timeout=150}
  augroup END
]],
  false
)
