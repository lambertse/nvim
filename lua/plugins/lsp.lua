return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Use system clangd
            lspconfig.clangd.setup({
                cmd = {"clangd", "--compile-commands-dir=./build"}
            })

            -- Use system rust-analyzer
            lspconfig.rust_analyzer.setup({
                cmd = {"rust-analyzer"} -- Ensure this is the system-installed rust-analyzer
            })
            lspconfig.gopls.setup {
                settings = {
                    gopls = {
                        analyses = {unusedparams = true},
                        staticcheck = true
                    }
                }
            }
        end
    }
}

