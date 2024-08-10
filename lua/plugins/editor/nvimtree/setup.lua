local map = vim.keymap.set

-- global
map({ "n", "i" }, "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })
map({ "n", "i" }, "<C-e>", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree toggle window" })

require("nvim-tree").setup({
  git = {
    enable = false, -- Disable Git status
  },

  view = {
    width = 30,
    preserve_window_proportions = true,
    signcolumn = "no",
  },

  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
      },
    },
  },
})
