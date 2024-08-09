local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search with <esc>
map({ "i", "n" }, "<C-c>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "Redraw / Clear hlsearch / Diff Update" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better jump to end, start of line
map("n", "<", "^", { noremap = true, silent = true })
map("n", ">", "$", { noremap = true, silent = true })

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

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function() go { severity = severity } end
end
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
