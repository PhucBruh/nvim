-- Map Ctrl-c to Esc in insert mode
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true, silent = true })

local cmp = require "cmp"

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ["<C-l>"] = cmp.mapping.confirm { select = true },
  },
}

vim.o.foldcolumn = "1"
