local map = vim.keymap.set

---@Key-General
map("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
map("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })

---@Key-HighLightSearch
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

---@Key-save
map("n", "<leader>w", ":w<CR>", { desc = "Save" })

---@Key-find
local builtin = require "telescope.builtin"
local function find_config()
  builtin.find_files {
    prompt_title = "Config Files",
    cwd = vim.fn.stdpath "config",
    follow = true,
  }
end
local function find_themes() builtin.colorscheme { enable_preview = true, ignore_builtins = true } end

map("n", "<leader>fa", find_config, { desc = "Find config file" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fc", builtin.grep_string, { desc = "Find word under cursor" })
map("n", "<leader>fr", builtin.registers, { desc = "Find registers" })
map("n", "<leader>fw", builtin.live_grep, { desc = "Find words" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })
map("n", "<leader>ft", find_themes, { desc = "Find themes" })
map("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find words in current buffer" })
map("n", "<leader>fn", require("telescope").extensions.notify.notify, { desc = "Find notification" })

---@Key-comment
local comment = require "Comment.api"
map("n", "<leader>/", comment.call("toggle.linewise.current", "g@$"), { expr = true, desc = "Toggle comment line" })
map("v", "<leader>/", comment.call("toggle.linewise", "g@"), { expr = true, desc = "Toggle comment block" })

---@Key-goto
map("n", "gd", vim.lsp.buf.definition, { expr = true, desc = "Show the definition of current symbol" })
map("n", "gD", vim.lsp.buf.declaration, { expr = true, desc = "Declaration of current symbol" })

---@Key-explorer
map({ "n", "i" }, "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })
map({ "n", "i" }, "<C-o>", "<cmd>Oil<CR>", { desc = "Oil" })
