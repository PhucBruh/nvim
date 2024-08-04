local map = vim.keymap.set

---@WindowNaviagtion
map("n", "<A-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<A-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<A-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<A-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

---@Toggle
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

---@WindowSplit
map("n", "<leader>wv", ":vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>wh", ":split<cr>", { desc = "Split horizontal" })

---@Telescope
---@TelescopeBuiltin
local builtin = require "telescope.builtin"
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Find grep" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "Find resume" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })
map("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find words in current buffer" })

---@Nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })
map("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Nvimtree focus window" })

---@Comment
local comment = require "Comment.api"
map("i", "<Ctrl>/", comment.call("toggle.linewise.current", "g@$"), { expr = true, desc = "Toggle comment line" })
map("n", "<leader>/", comment.call("toggle.linewise.current", "g@$"), { expr = true, desc = "Toggle comment line" })
map("v", "<leader>/", comment.call("toggle.linewise", "g@"), { expr = true, desc = "Toggle comment block" })
