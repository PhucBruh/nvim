vim.o.laststatus = 0

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    -- for dbui
    "dbui",
    "dbout",
  },
  callback = function()
    vim.wo.winbar = nil
    vim.wo.number = false
    vim.o.foldenable = false
    vim.o.foldcolumn = "0"
  end,
})

-- ignore buffer win enter
local ig_bwe = {
  -- for dapui
  "dapui_watches",
  "dapui_stacks",
  "dapui_breakpoints",
  "dapui_scopes",
  "dap-repl",
  "dapui_console",
}
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    local filetype = vim.bo.filetype
    if vim.tbl_contains(ig_bwe, vim.bo.filetype) then
      -- Disable the fold column for dapui windows
      vim.wo.foldcolumn = "0"
    end
  end,
})

vim.api.nvim_create_autocmd({ "LspAttach", "InsertEnter", "InsertLeave" }, {
  callback = function(args)
    local enabled = args.event ~= "InsertEnter"
    vim.lsp.inlay_hint.enable(enabled, { bufnr = args.buf })
  end,
})
