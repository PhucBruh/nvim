return {
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {
      heading = {
        icons = { "󰎥 ", "󰎨 ", "󰎫 ", "󰎲 ", "󰎯 ", "󰎴 " },
      },
      latex = { converter = "latex2text" },
    },
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  },
  {
    "jakewvincent/mkdnflow.nvim",
    config = function()
      require("mkdnflow").setup {
        -- Config goes here; leave blank for defaults
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
}
