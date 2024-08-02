local kulala = require "kulala"
local map = vim.keymap.set

vim.api.nvim_create_autocmd("FileType", {
  pattern = "http",
  callback = function()
    local buff = tonumber(vim.fn.expand "<abuf>", 10)

    map("n", "<leader>rr", kulala.run, { noremap = true, buffer = buff, desc = "Run" })
    map("n", "<leader>rc", kulala.close, { noremap = true, buffer = buff, desc = "Close kulala" })
    map("n", "<leader>re", kulala.toggle_view, { noremap = true, buffer = buff, desc = "Toggle view" })
    map("n", "<leader>rn", kulala.jump_next, { noremap = true, buffer = buff, desc = "Next request" })
    map("n", "<leader>rp", kulala.jump_prev, { noremap = true, buffer = buff, desc = "Previous request" })
  end,
})

kulala.setup {}

require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }
