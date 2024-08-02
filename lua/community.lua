---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.html-css" },

  { import = "astrocommunity.completion.cmp-cmdline" },

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.file-explorer.oil-nvim" },
}
