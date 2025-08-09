return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Create consistent capabilities with utf-16 encoding
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.offsetEncoding = {"utf-16"}

            -- Use system clangd
            lspconfig.clangd.setup({
                cmd = {"clangd", "--compile-commands-dir=./build"},
                capabilities = capabilities
            })

            -- Use system rust-analyzer
            lspconfig.rust_analyzer.setup({
                cmd = {"rust-analyzer"},
                capabilities = capabilities
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
                settings = {
                    gopls = {
                        analyses = {unusedparams = true},
                        staticcheck = true
                    }
                }
            })
        end
    }
}
