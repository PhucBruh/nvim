local git_sign_icon = "▎"
local builtin = require "statuscol.builtin"

require("gitsigns").setup {
  signs = {
    add = { text = git_sign_icon },
    change = { text = git_sign_icon },
    delete = { text = git_sign_icon },
    topdelete = { text = git_sign_icon },
    changedelete = { text = git_sign_icon },
    untracked = { text = git_sign_icon },
  },
}

require("statuscol").setup {
  relculright = true,

  clickhandlers = {
    Lnum = builtin.gitsigns_click,
  },

  bt_ignore = {
    "nofile",
    "NvimTree",
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
        maxwidth = 1,
        colwidth = 2,
        auto = false,
        wrap = true,
      },
    },

    {
      text = { builtin.lnumfunc, " " },
      colwidth = 1,
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
}
