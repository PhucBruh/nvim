---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[
 ███▄    █   ▓█████    ▒█████     ██▒   █▓   ██▓   ███▄ ▄███▓
 ██ ▀█   █   ▓█   ▀   ▒██▒  ██▒  ▓██░   █▒  ▓██▒  ▓██▒▀█▀ ██▒
▓██  ▀█ ██  ▒▒███▀    ▒██░  ██▒   ▓██  █▒░  ▒██▒  ▓██    ▓██░
▓██▒  ▐▌██  ▒▒▓█  ▄   ▒██   ██░    ▒██ █░░  ░██░  ▒██    ▒██ 
▒██░   ▓██  ░░▒████▒░   ████▓▒░     ▒▀██    ░██░  ▒██▒   ░██▒
░ ▒░   ▒ ▒   ░░ ▒░ ░░   ▒░▒░▒░      ░ ▐░    ░▓    ░ ▒░   ░  ░
░ ░░   ░ ▒░   ░ ░  ░    ░ ▒ ▒░      ░ ░░     ▒   ░░  ░      ░
   ░   ░  ░     ░   ░   ░ ░ ▒         ░░     ▒   ░░       ░ 
         ░      ░  ░      ░ ░          ░     ░           ░  
                                      ░                       ]]
      opts.section.header.val = vim.split(logo, "\n")

      -- Adjust padding between header and buttons
      opts.section.header.opts = {
        position = "center",
        hl = "Title",
      }

      opts.section.buttons.opts = {}
      return opts
    end,
  },

  {
    "h-hg/fcitx.nvim",
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      opts.winbar = nil

      opts.statuscolumn = { -- statuscolumn
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        status.component.signcolumn(),
        status.component.foldcolumn(),
        status.component.numbercolumn(),
      }
    end,
  },
}
