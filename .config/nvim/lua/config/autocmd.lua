--[[local function prettier_config_exists()
    local cwd = vim.fn.getcwd()
    local matches = vim.fn.glob(cwd .. "/*prettier*", false, true)
    return #matches > 0
end

local function format_with_prettier_or_lsp()
    if prettier_config_exists() then
        vim.cmd("PrettierAsync")
    else
        local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
        if #clients > 0 then
            vim.lsp.buf.format({ async = true })
        else
            vim.notify("No Prettier config or LSP client found to format", vim.log.levels.WARN)
        end
    end
end
--]]

vim.api.nvim_create_autocmd("BufWritePre", {
    -- todo por ahora hasta que necesite algo en especial
    -- evaluar el uso de conform.nvim con el que se puede configurar
    -- formatters para cada tipo de archivo, como prettierd para tsx/etc
    -- y no reemplaza el buffer completo
    -- pattern = "*",
    callback = function()
        local cwd = vim.fn.getcwd()
        local matches = vim.fn.glob(cwd .. "/*prettier*", false, true)
        if #matches > 0 then
            print("HERE")
            vim.cmd("Prettier")
        else
            local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
            if #clients > 0 then
                vim.lsp.buf.format({ async = false })
            else
                vim.notify("No Prettier config or LSP client found to format", vim.log.levels.WARN)
            end
        end
    end
})
