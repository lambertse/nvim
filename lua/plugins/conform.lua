return {
    "stevearc/conform.nvim",
    opts = function()
        local opts = {
            formatters_by_ft = {
                cpp = {"clang-format"}, 
                lua = {"lua-format"}, 
                c = {"clang-format"},  
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                vue = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                less = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                jsonc = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },},
            formatters = {
                ["clang-format"] = {
                    command = "clang-format",
                    args = {"--style=Google"}
                },
                ["lua-format"] = {command = "lua-format"},
            }
        }
        return opts
    end
}

-- Format with lua: brew install fish
