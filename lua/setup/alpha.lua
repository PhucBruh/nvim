local dashboard = require "alpha.themes.dashboard"
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

dashboard.section.header.val = vim.split(logo, "\n")
-- stylua: ignore
dashboard.section.buttons.val = { }
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.layout[1].val = 8

if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    once = true,
    pattern = "AlphaReady",
    callback = function() require("lazy").show() end,
  })
end

vim.api.nvim_create_autocmd("User", {
  once = true,
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
    pcall(vim.cmd.AlphaRedraw)
  end,
})

require("alpha").setup(dashboard.opts)
