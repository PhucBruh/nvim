local function dbui_focus()
  -- close alpha if is active
  if vim.bo.filetype == "alpha" then vim.cmd "bd" end
  vim.cmd "DBUI"
end

local function dbui_toggle()
  -- close alpha if is active
  if vim.bo.filetype == "alpha" then vim.cmd "bd" end
  vim.cmd "DBUIToggle"
end

local map = vim.keymap.set
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_use_nvim_notify = 1
vim.g.db_ui_show_help = 0
vim.g.db_ui_debug = 1

-- Disable folding in Dadbod UI buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbui",
  callback = function()
    -- Disable folding for dbui buffers
    vim.wo.foldenable = false
    vim.wo.foldcolumn = "0"
    vim.wo.winbar = nil

    -- Set buffer-specific key mappings
    map("n", "h", "<Plug>(DBUI_GotoParentNode)", { buffer = 0, noremap = true, silent = true })
    map("n", "l", "<Plug>(DBUI_GotoChildNode)", { buffer = 0, noremap = true, silent = true })
    map("n", "a", ":DBUIAddConnection<CR>", { buffer = 0, noremap = true, silent = true })
  end,
})

map("n", "<leader><Tab>o", dbui_focus, { noremap = true, silent = true, desc = "Focus Dadbob" })
map("n", "<leader><Tab>e", dbui_toggle, { noremap = true, silent = true, desc = "Toggle Dadbob" })
map("n", "<leader><Tab>n", ":DBUIAddConnection<CR>", { noremap = true, silent = true, desc = "Add connection" })
