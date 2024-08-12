return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")

    -- Normal telescope find
    map("n", "<leader>fa", function()
      builtin.find_files({
        prompt_title = "Config Files",
        cwd = vim.fn.stdpath("config"),
        follow = true,
      })
    end, { desc = "Find config file" })
    map("n", "<leader>f'", builtin.marks, { desc = "Marks" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    map("n", "<leader>fc", builtin.grep_string, { desc = "Word under cursor" })
    map("n", "<leader>fC", builtin.commands, { desc = "Command" })
    map("n", "<leader>ff", builtin.find_files, { desc = "Files" })
    map("n", "<leader>fF", function()
      require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
    end, { desc = "Find all files" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
    map("n", "<leader>fm", builtin.man_pages, { desc = "Man" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
    map("n", "<leader>fr", builtin.registers, { desc = "Registers" })
    map("n", "<leader>ft", function()
      builtin.colorscheme({ enable_preview = true, ignore_builtins = true })
    end, { desc = "Find themes" })
    map("n", "<leader>fw", builtin.live_grep, { desc = "Words" })
    map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
    map("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Find words in current buffer" })
    map("n", "<leader>fn", "<cmd>Noice telescope<CR>", { desc = "Noice" })

    -- Git telescope find

    map("n", "<leader>gb", function()
      builtin.git_branches({ use_file_path = true })
    end, { desc = "Branches" })
    map("n", "<leader>gc", function()
      builtin.git_commits({ use_file_path = true })
    end, { desc = "Commit (repository)" })
    map("n", "<leader>gC", function()
      builtin.git_bcommits({ use_file_path = true })
    end, { desc = "Commit (current file)" })
    map("n", "<leader>gt", function()
      builtin.git_status({ use_file_path = true })
    end, { desc = "Status" })
  end,
}
