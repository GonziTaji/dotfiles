return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- :help ins-completion para ver como funciona el autocompletado
        {
            -- para configurar lua_ls sobre variables globales de vim
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            },
            config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<Tab>"] = cmp.mapping.select_next_item(),
                        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ["<C-Space>"] = cmp.mapping.complete(),
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = "path" },
                    }),
                })
            end,
        }
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("lspconfig").ts_ls.setup({
            capabilities = capabilities
        })
        require("lspconfig").lua_ls.setup({
            capabilities = capabilities
        })

        require("lspconfig").gopls.setup({
            capabilities = capabilities,
            settings = {
                completeUnimported = true
            }
        })
    end,
}
