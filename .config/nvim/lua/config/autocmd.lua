local autocmd = vim.api.nvim_create_autocmd
--[[
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
]]

local function can_format()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if #clients > 0 then
    local client = clients[1]
    if client.attached_buffers and client.attached_buffers[bufnr] then
      if client.supports_method("textDocument/formatting") then
        return true
      end
    end
  end

  return false
end


local function format()
  -- Usa prettier si hay config en el current cwd
  -- Si no hay prettier usa el lsp para formatear
  -- Si no hay lsp para formatear, notifica con un mensaje

  local cwd = vim.fn.getcwd()
  local matches = vim.fn.glob(cwd .. "/*prettier*", false, true)

  if #matches > 0 then
    vim.notify("PRETTIER USED TO FORMAT")
    vim.cmd("Prettier")
    return
  end

  if can_format() then
    vim.notify("LSP USED TO FORMAT")
    vim.lsp.buf.format({ async = false })
    return
  end

  vim.notify("NO LSP NOR PRETTIER USED TO FORMTAT")

  vim.cmd("normal! mx")
  vim.cmd("normal! ggVG==")
  vim.cmd("normal! `x")
end


autocmd("BufWritePre", {
  callback = format
})

autocmd("InsertLeavePre", {
  callback = format
})
