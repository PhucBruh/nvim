return {
  "luukvbaal/statuscol.nvim",
  branch = "0.10",
  config = function()
    local git_sign_icon = "▎"
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,

      clickhandlers = {
        Lnum = builtin.gitsigns_click,
      },

      ft_ignore = {
        "alpha",
        "dbui",
        "dbee",
        "dbout",
        "NvimTree",
      },
      bt_ignore = {
        "terminal",
      },
      segments = {
        {
          sign = {
            name = { "GitSigns*" },
            namespace = { "gitsigns" },
            colwidth = 1,
            fillchar = git_sign_icon,
            fillcharhl = "Nrline",
          },
          click = "v:lua.ScSa",
        },

        {
          sign = {
            name = { ".*" },
            namespace = { ".*" },
            maxwidth = 2,
            colwidth = 1,
            auto = false,
            wrap = true,
          },
        },

        {
          text = { builtin.lnumfunc, " " },
          maxwidth = 3,
          colwidth = 3,
          click = "v:lua.ScLa",
        },

        {
          text = {
            function(args)
              args.fold.close = ""
              args.fold.open = ""
              args.fold.sep = " "
              return builtin.foldfunc(args)
            end,
            " ",
          },
          hl = "FoldColumn",
          wrap = true,
          colwidth = 1,
          click = "v:lua.ScFa",
        },
      },
    })
  end,
}
