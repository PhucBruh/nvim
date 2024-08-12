return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")

    map("n", "<leader>fa", function()
      builtin.find_files({
        prompt_title = "Config Files",
        cwd = vim.fn.stdpath("config"),
        follow = true,
      })
    end, { desc = "Find config file" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fc", builtin.grep_string, { desc = "Find word under cursor" })
    map("n", "<leader>fr", builtin.registers, { desc = "Find registers" })
    map("n", "<leader>fw", builtin.live_grep, { desc = "Find words" })
    map("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "Find recent files" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Find recent files" })
    map("n", "<leader>ft", function()
      builtin.colorscheme({ enable_preview = true, ignore_builtins = true })
    end, { desc = "Find themes" })
    map("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find words in current buffer" })
    map("n", "<leader>fn", "<cmd>Noice telescope<CR>", { desc = "Find notification" })
  end,
}
