vim.o.laststatus = 0

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dbui", "dbout" },
  callback = function()
    vim.wo.winbar = nil
    vim.wo.number = false
    vim.o.foldenable = false
    vim.o.foldcolumn = "0"
  end,
})

vim.api.nvim_create_autocmd({ "LspAttach", "InsertEnter", "InsertLeave" }, {
  callback = function(args)
    local enabled = args.event ~= "InsertEnter"
    vim.lsp.inlay_hint.enable(enabled, { bufnr = args.buf })
  end,
})
