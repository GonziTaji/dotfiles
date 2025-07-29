local autocmd = vim.api.nvim_create_autocmd

local format = function()
  -- Usa prettier si hay config en el current cwd
  -- Si no hay prettier usa el lsp para formatear
  -- Si no hay lsp para formatear, notifica con un mensaje

  local cwd = vim.fn.getcwd()
  local matches = vim.fn.glob(cwd .. "/*prettier*", false, true)
  if #matches > 0 then
    print("PRETTIER USED")
    vim.cmd("Prettier")
  else
    print("PRETTIER NOT USED")
    local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
    if #clients > 0 then
      vim.lsp.buf.format({ async = false })
    else
      vim.notify("No Prettier config or LSP client found to format", vim.log.levels.WARN)
    end
  end
end

autocmd("BufWritePre", {
  callback = format
})

autocmd("InsertLeavePre", {
  callback = format
})
