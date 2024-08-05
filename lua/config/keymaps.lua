local map = vim.keymap.set

---@Key-HighLightSearch
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

---@Key-Telescope
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

---@Key-Nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })
map("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Nvimtree focus window" })

---@Key-Comment
local comment = require "Comment.api"
map("n", "<leader>/", comment.call("toggle.linewise.current", "g@$"), { expr = true, desc = "Toggle comment line" })
map("v", "<leader>/", comment.call("toggle.linewise", "g@"), { expr = true, desc = "Toggle comment block" })
