local colors = require("catppuccin.palettes").get_palette "macchiato"

local theme = {
  normal = {
    a = { fg = colors.green },
    b = { fg = colors.blue },
    c = { fg = colors.teal },
  },
  insert = { a = { fg = colors.blue } },
  visual = { a = { fg = colors.pink } },
  replace = { a = { fg = colors.yellow } },
  command = { a = { fg = colors.red } },
  inactive = {
    a = { fg = colors.peach },
    b = { fg = colors.blue },
    c = { fg = colors.green },
  },
}

local filetype = {
  "filetype",
  icon_only = true,
  colored = true,
}

local fileformat = {
  "fileformat",
  color = { fg = colors.teal },
}

local encoding = {
  "encoding",
  color = { fg = colors.blue },
}

local branch = {
  "branch",
  color = { fg = colors.overlay1 },
}

local diff = {
  "diff",
  color = { fg = colors.mauve },
  colored = true, -- Displays a colored diff status if set to true
  diff_color = {
    -- Same color values as the general color option can be used here.
    added = "LuaLineDiffAdd", -- Changes the diff's added color
    modified = "LuaLineDiffChange", -- Changes the diff's modified color
    removed = "LuaLineDiffDelete", -- Changes the diff's removed color you
  },
  symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
}

local dia = {
  "diagnostics",
  color = { fg = colors.lavender },
}

local function mode_icon()
  local mode = vim.api.nvim_get_mode().mode
  local icons = {
    n = " ", -- Normal mode
    i = "󰴒 ", -- Insert mode
    v = "󰈈 ", -- Visual mode
    V = "󰈈 ", -- Visual Line mode
    c = " ", -- Command mode
    t = " ", -- Terminal mode
    s = "󰩐 ",
  }

  return icons[mode] or " " -- Default icon
end

require("lualine").setup {

  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      winbar = 1000,
    },
  },

  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str) return mode_icon() .. str end,
      },
    },
    lualine_b = {},
    lualine_c = {
      "harpoon2",
      {
        "filename",
        status = true,
      },
      filetype,
      branch,
      diff,
    },
    lualine_x = {},
    lualine_y = {
      encoding,
      fileformat,
    },
    lualine_z = {
      dia,
      "ex.lsp.single",
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
}
