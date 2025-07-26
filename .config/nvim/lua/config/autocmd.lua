local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
    -- Usa prettier si hay config en el current cwd
    -- Si no hay prettier usa el lsp para formatear
    -- Si no hay lsp para formatear, notifica con un mensaje
    callback = function()
        local cwd = vim.fn.getcwd()
        local matches = vim.fn.glob(cwd .. "/*prettier*", false, true)
        if #matches > 0 then
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
